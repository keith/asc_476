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

ActiveRecord::Schema.define(version: 20140401152121) do

  create_table "applicants", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "wuid"
    t.string   "phone_number"
    t.integer  "class_standing"
    t.float    "gpa"
    t.datetime "gpa_timestamp"
    t.text     "comment"
    t.string   "major"
    t.string   "minor"
    t.boolean  "work_study"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
  end

  create_table "available_times", force: true do |t|
    t.integer  "day"
    t.time     "start"
    t.time     "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "applicant_id"
  end

  create_table "courses", force: true do |t|
    t.string   "designator"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "hidden"
    t.boolean  "disabled"
  end

  create_table "positions", force: true do |t|
    t.text     "professor_comments"
    t.boolean  "professor_verdict"
    t.boolean  "professor_taught"
    t.integer  "application_status"
    t.text     "asc_comments"
    t.integer  "applicant_id"
    t.integer  "professor_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
  end

  create_table "professors", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
