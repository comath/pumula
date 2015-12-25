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

ActiveRecord::Schema.define(version: 20151225050459) do

  create_table "assessment_weights", force: :cascade do |t|
    t.text     "name"
    t.decimal  "weight",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "assessments", force: :cascade do |t|
    t.string   "name"
    t.integer  "course_instance_id"
    t.datetime "due_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "assessment_weights_id"
  end

  add_index "assessments", ["assessment_weights_id"], name: "index_assessments_on_assessment_weights_id"
  add_index "assessments", ["course_instance_id"], name: "index_assessments_on_course_instance_id"

  create_table "course_instances", force: :cascade do |t|
    t.string   "semester"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_instances", ["course_id"], name: "index_course_instances_on_course_id"

  create_table "courses", force: :cascade do |t|
    t.text     "tag_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "instructors", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "course_instance_id"
    t.string   "name"
  end

  add_index "instructors", ["course_instance_id"], name: "index_instructors_on_course_instance_id"

  create_table "problem_attempts", force: :cascade do |t|
    t.text     "comment"
    t.integer  "student_attempt_id"
    t.integer  "problem_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.decimal  "score",              precision: 8, scale: 2
    t.boolean  "completed"
  end

  add_index "problem_attempts", ["problem_id"], name: "index_problem_attempts_on_problem_id"
  add_index "problem_attempts", ["student_attempt_id"], name: "index_problem_attempts_on_student_attempt_id"

  create_table "problems", force: :cascade do |t|
    t.string   "name"
    t.string   "tags"
    t.integer  "assessment_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.decimal  "points",        precision: 8, scale: 2
  end

  add_index "problems", ["assessment_id"], name: "index_problems_on_assessment_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.datetime "lastlogin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "course_instance_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "name"
  end

  add_index "sections", ["course_instance_id"], name: "index_sections_on_course_instance_id"

  create_table "student_attempts", force: :cascade do |t|
    t.datetime "hand_in"
    t.text     "comment"
    t.integer  "student_id"
    t.integer  "assessment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "student_attempts", ["assessment_id"], name: "index_student_attempts_on_assessment_id"
  add_index "student_attempts", ["student_id"], name: "index_student_attempts_on_student_id"

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "section_id"
    t.string   "name"
  end

  add_index "students", ["section_id"], name: "index_students_on_section_id"

  create_table "ta", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "section_id"
  end

  add_index "ta", ["section_id"], name: "index_ta_on_section_id"

end
