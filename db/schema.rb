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

ActiveRecord::Schema.define(version: 20171005140015) do

  create_table "assignments", force: :cascade do |t|
    t.string   "name"
    t.date     "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user"
    t.datetime "start_time"
    t.string   "avatar"
    t.integer  "user_id"
    t.index ["user"], name: "index_assignments_on_user"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "subject_id"
    t.index ["subject_id"], name: "index_calendars_on_subject_id"
  end

  create_table "course_progresses", force: :cascade do |t|
    t.integer  "time_spent"
    t.integer  "time_due"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "performance"
    t.index ["performance"], name: "index_course_progresses_on_performance"
  end

  create_table "discussions", force: :cascade do |t|
    t.text     "discussion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user"
    t.integer  "subject"
    t.index ["subject"], name: "index_discussions_on_subject"
    t.index ["user"], name: "index_discussions_on_user"
  end

  create_table "donates", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "amount_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "CreditCardType"
    t.string   "CreditCardNumber"
    t.integer  "ExpMonth"
    t.integer  "ExpYear"
    t.integer  "CVV"
    t.index ["user_id"], name: "index_donates_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "to"
    t.integer  "sender"
    t.text     "feedback"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "performance"
    t.integer  "user"
    t.index ["performance"], name: "index_feedbacks_on_performance"
    t.index ["user"], name: "index_feedbacks_on_user"
  end

  create_table "grade_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "grade"
    t.integer  "assignment"
    t.integer  "user"
    t.index ["assignment"], name: "index_grade_users_on_assignment"
    t.index ["grade"], name: "index_grade_users_on_grade"
    t.index ["user"], name: "index_grade_users_on_user"
  end

  create_table "grades", force: :cascade do |t|
    t.string   "grade"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "performance"
    t.index ["performance"], name: "index_grades_on_performance"
  end

  create_table "helps", force: :cascade do |t|
    t.integer  "user_type"
    t.text     "learn"
    t.integer  "level_type"
    t.text     "goal"
    t.string   "email",       default: "", null: false
    t.text     "description", default: "", null: false
    t.string   "avatar"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "user_id"
    t.integer  "score",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["subject_id"], name: "index_ratings_on_subject_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.text     "objective"
    t.text     "lesson_plan"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "avatar"
    t.string   "homepage"
    t.index ["user_id"], name: "index_subjects_on_user_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.integer  "subject_id"
    t.string   "category"
    t.integer  "experience"
    t.string   "bubble_option"
    t.string   "media"
    t.string   "skills"
    t.string   "reason"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["subject_id"], name: "index_surveys_on_subject_id"
  end

  create_table "tutor_assistants", force: :cascade do |t|
    t.text     "questions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user"
    t.index ["user"], name: "index_tutor_assistants_on_user"
  end

  create_table "user_assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "educator_id"
    t.integer  "assignment_id"
    t.string   "description"
    t.string   "avatar"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assignment_id"], name: "index_user_assignments_on_assignment_id"
    t.index ["educator_id"], name: "index_user_assignments_on_educator_id"
    t.index ["user_id"], name: "index_user_assignments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                    default: "",   null: false
    t.string   "encrypted_password",       default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "role"
    t.string   "avatar"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.boolean  "is_male",                  default: true
    t.string   "level_of_education"
    t.string   "concentration"
    t.string   "institution_of_education"
    t.string   "location"
    t.string   "race"
    t.string   "employment_status"
    t.string   "languages"
    t.string   "username"
    t.string   "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

end
