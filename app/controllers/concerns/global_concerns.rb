module GlobalConcerns
  include ActiveSupport::Concern

  def format_monitoring_service(monitoring_service)
    monitoring_service.contrats.reorder(day: :asc).map do |contrat|
      {
        id: contrat.id,
        day: contrat.day,
        start_hour: contrat.start_hour.strftime('%H'),
        end_hour: contrat.end_hour.strftime('%H'),
        hours: hours_list(contrat.start_hour, contrat.end_hour, 34, contrat.monitoring_services_id, contrat.day)
      }
    end
  end

  def format_weeks
    weeks_list = AvailabilitySchedule.select(:week).all.reorder(week: :asc).uniq
    week_num = Time.zone.today.strftime('%U').to_i
    add_more_weeks(weeks_list, week_num)
  end

  def add_more_weeks(weeks_list, week_num)
    if weeks_list.length.zero? || weeks_list.last.week <= week_num
      add_five_weeks(weeks_list, week_num)
    else
      add_diff_weeks(weeks_list, week_num)
    end
  end

  def add_five_weeks(weeks_list, week_num)
    week_set = weeks_list.length.zero? ? week_num : weeks_list.last.week
    week_five_more = week_num + 5
    while week_five_more > week_set
      weeks_list.push({ week: week_set })
      week_set += 1
    end
    weeks_list
  end

  def add_diff_weeks(weeks_list, week_num)
    week_set = (weeks_list.last.week + 1)
    diff = 5 - (weeks_list.last.week - week_num)
    if diff.positive?
      week_add_more = week_set + diff
      while week_add_more > week_set
        weeks_list.push({ week: week_set })
        week_set += 1
      end
    end
    weeks_list
  end

  def hours_list(start_hour, end_hour, week, monitoring_services_id, day)
    start_time = start_hour.strftime('%H').to_i
    end_time = end_hour.strftime('%H').to_i.zero? ? 24 : end_hour.strftime('%H').to_i
    hour_per_day = end_time - start_time

    generate_hour_range(start_hour, hour_per_day, week, monitoring_services_id, day)
  end

  def generate_hour_range(start_hour, hour_per_day, week, monitoring_services_id, day)
    hours_array = []
    i = 0
    while hour_per_day > i
      hours_array.push({
                         hour_range: "#{range_format(start_hour, i)}:00 - #{range_format(start_hour, i, true)}:00",
                         hour: start_hour.strftime('%H').to_i,
                         users: User.all.map do |_user|
                                  { id: _user.id, value: available_by_user?("#{range_format(start_hour, i)}:00:00", week, monitoring_services_id,
                                                                            day, _user.id) }
                                end,
                         line_class: available?("#{range_format(start_hour, i)}:00:00", week, monitoring_services_id,
                                                day)
                       })
      i += 1
    end
    hours_array
  end

  def range_format(hour, range_count, end_time = false)
    if end_time
      hour.strftime('%H').to_i + (range_count + 1) == 24 ? '00' : hour.strftime('%H').to_i + (range_count + 1)
    else
      hour.strftime('%H').to_i + range_count
    end
  end

  def available?(start_hour, week, monitoring_services_id, day)
    if AvailabilitySchedule.exists?(monitoring_services_id: monitoring_services_id, week: week, day: day,
                                    hour: start_hour)
      'has-background-success'
    else
      'has-background-danger'
    end
  end

  def available_by_user?(start_hour, week, monitoring_services_id, day, user_id)
    AvailabilitySchedule.exists?(
      monitoring_services_id: monitoring_services_id,
      week: week,
      day: day,
      hour: start_hour,
      users_id: user_id
    )
  end
end
