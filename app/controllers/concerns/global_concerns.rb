module GlobalConcerns
  include ActiveSupport::Concern

  def format_monitoring_service(monitoring_service)
    monitoring_service.contrats.reorder(day: :asc).map do |contrat|
      {
        id: contrat.id,
        day: contrat.day,
        start_hour: contrat.start_hour.strftime('%H'),
        end_hour: contrat.end_hour.strftime('%H')
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
end
