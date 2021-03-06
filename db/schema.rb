# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160901065152) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "city"
    t.string   "state"
    t.text     "locality"
  end

  add_index "addresses", ["resource_type", "resource_id"], name: "index_addresses_on_resource_type_and_resource_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "companies", ["employee_id"], name: "index_companies_on_employee_id"

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "company_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "salary"
    t.string   "designation"
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id"
  add_index "employees", ["email", "company_id"], name: "index_employees_on_email_and_company_id", unique: true
  add_index "employees", ["phone", "company_id"], name: "index_employees_on_phone_and_company_id", unique: true

end
