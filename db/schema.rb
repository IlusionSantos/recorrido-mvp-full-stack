# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_16_081618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availability_schedules", force: :cascade do |t|
    t.integer "week"
    t.integer "day"
    t.time "hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "monitoring_services_id"
    t.bigint "users_id"
    t.index ["day"], name: "index_availability_schedules_on_day"
    t.index ["monitoring_services_id"], name: "index_availability_schedules_on_monitoring_services_id"
    t.index ["users_id"], name: "index_availability_schedules_on_users_id"
    t.index ["week"], name: "index_availability_schedules_on_week"
  end

  create_table "contrats", force: :cascade do |t|
    t.integer "day"
    t.time "start_hour"
    t.time "end_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "monitoring_services_id"
    t.index ["day"], name: "index_contrats_on_day"
    t.index ["monitoring_services_id"], name: "index_contrats_on_monitoring_services_id"
  end

  create_table "monitoring_schedules", force: :cascade do |t|
    t.integer "week"
    t.integer "day"
    t.time "hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "monitoring_services_id"
    t.bigint "users_id"
    t.index ["day"], name: "index_monitoring_schedules_on_day"
    t.index ["monitoring_services_id"], name: "index_monitoring_schedules_on_monitoring_services_id"
    t.index ["users_id"], name: "index_monitoring_schedules_on_users_id"
    t.index ["week"], name: "index_monitoring_schedules_on_week"
  end

  create_table "monitoring_services", force: :cascade do |t|
    t.string "company_name"
    t.integer "total_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_name"], name: "index_monitoring_services_on_company_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_users_on_first_name"
  end

  add_foreign_key "availability_schedules", "monitoring_services", column: "monitoring_services_id"
  add_foreign_key "availability_schedules", "users", column: "users_id"
  add_foreign_key "contrats", "monitoring_services", column: "monitoring_services_id"
  add_foreign_key "monitoring_schedules", "monitoring_services", column: "monitoring_services_id"
  add_foreign_key "monitoring_schedules", "users", column: "users_id"
end
