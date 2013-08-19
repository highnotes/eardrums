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

ActiveRecord::Schema.define(version: 20130816113200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "batch_schedules", force: true do |t|
    t.integer  "batch_id"
    t.string   "status"
    t.date     "scheduled_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "batch_schedules", ["batch_id"], name: "index_batch_schedules_on_batch_id", using: :btree

  create_table "batches", force: true do |t|
    t.string   "status"
    t.integer  "discipline_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day"
    t.time     "start_time"
    t.integer  "duration"
    t.integer  "created_by"
    t.integer  "modified_by"
  end

  add_index "batches", ["discipline_id"], name: "index_batches_on_discipline_id", using: :btree

  create_table "batches_users", id: false, force: true do |t|
    t.integer "batch_id"
    t.integer "user_id"
  end

  create_table "branches", force: true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.string   "status"
    t.date     "opened_on"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "phones"
    t.integer  "franchise_id"
    t.date     "closed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "modified_by"
  end

  add_index "branches", ["franchise_id"], name: "index_branches_on_franchise_id", using: :btree

  create_table "branches_courses", id: false, force: true do |t|
    t.integer "branch_id"
    t.integer "course_id"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "duration"
    t.decimal  "price"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level_id"
    t.integer  "discipline_id"
    t.integer  "teacher_id"
    t.integer  "index"
    t.string   "code"
    t.integer  "created_by"
    t.integer  "modified_by"
  end

  create_table "disciplines", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", force: true do |t|
    t.string   "application_no"
    t.string   "membership_no"
    t.integer  "branch_id"
    t.integer  "course_id"
    t.integer  "batch_id"
    t.integer  "student_id"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.date     "enrolled_on"
    t.integer  "duration"
    t.string   "status"
    t.decimal  "registration_fee"
    t.decimal  "course_fee"
    t.decimal  "total"
    t.string   "mode"
    t.string   "details"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.string   "txn_status"
    t.string   "reversal_reason_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.text     "experience"
    t.text     "additional_courses"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discipline_id"
  end

  add_index "enrollments", ["batch_id"], name: "index_enrollments_on_batch_id", using: :btree
  add_index "enrollments", ["branch_id"], name: "index_enrollments_on_branch_id", using: :btree
  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id", using: :btree

  create_table "franchises", force: true do |t|
    t.string   "name"
    t.string   "franchisees"
    t.string   "emails"
    t.string   "phones"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "modified_by"
  end

  create_table "identities", force: true do |t|
    t.string   "uid"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "installments", force: true do |t|
    t.integer  "course_id"
    t.integer  "index"
    t.integer  "no_of_installments"
    t.integer  "interval"
    t.decimal  "amount"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "installments", ["course_id"], name: "index_installments_on_course_id", using: :btree

  create_table "lessons", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "index"
  end

  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id", using: :btree

  create_table "levels", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "index"
  end

  create_table "masters", force: true do |t|
    t.string   "group"
    t.integer  "index"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["lesson_id"], name: "index_materials_on_lesson_id", using: :btree

  create_table "payment_schedules", force: true do |t|
    t.integer  "enrollment_id"
    t.date     "due_on"
    t.string   "status"
    t.integer  "payment_id"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_schedules", ["enrollment_id"], name: "index_payment_schedules_on_enrollment_id", using: :btree
  add_index "payment_schedules", ["payment_id"], name: "index_payment_schedules_on_payment_id", using: :btree

  create_table "payments", force: true do |t|
    t.string   "mode"
    t.string   "transaction_type"
    t.decimal  "registration_fee"
    t.decimal  "course_fee"
    t.decimal  "total"
    t.string   "narration"
    t.string   "status"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rolls", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "branch_id"
    t.integer  "duration"
    t.integer  "attended"
    t.date     "to_end_on"
    t.date     "ended_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rolls", ["branch_id"], name: "index_rolls_on_branch_id", using: :btree
  add_index "rolls", ["course_id"], name: "index_rolls_on_course_id", using: :btree

  create_table "student_schedules", force: true do |t|
    t.integer  "student_id"
    t.integer  "batch_schedule_id"
    t.date     "attended_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_schedules", ["batch_schedule_id"], name: "index_student_schedules_on_batch_schedule_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "unconfirmed_email"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "role"
    t.string   "invitation_token",       limit: 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "course_id"
    t.integer  "branch_id"
  end

  add_index "users", ["branch_id"], name: "index_users_on_branch_id", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
