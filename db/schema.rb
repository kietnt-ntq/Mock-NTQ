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

ActiveRecord::Schema.define(version: 20191027182338) do

  create_table "attendance_events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.string "note", default: "đã điểm danh"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendance_events_on_event_id"
    t.index ["user_id"], name: "index_attendance_events_on_user_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "user_id"
    t.integer "content_id"
    t.string "note", default: "đã điểm danh"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_attendances_on_content_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "thumbnail"
    t.string "level"
    t.string "document"
    t.date "startDate"
    t.date "endDate"
    t.string "status"
    t.boolean "isDone"
    t.boolean "isAppove"
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_contents_on_group_id"
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "user_id"
    t.string "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "thumbnail"
    t.string "content"
    t.text "document"
    t.datetime "startDate"
    t.datetime "endDate"
    t.float "duration"
    t.string "color"
    t.text "speaker"
    t.string "something"
    t.integer "user_id"
    t.integer "group_id"
    t.integer "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_events_on_content_id"
    t.index ["group_id"], name: "index_events_on_group_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "decription"
    t.string "picture"
    t.string "cover"
    t.date "startdate"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "created_at"], name: "index_groups_on_course_id_and_created_at"
    t.index ["course_id"], name: "index_groups_on_course_id"
    t.index ["name"], name: "index_groups_on_name", unique: true
    t.index [nil, "created_at"], name: "index_groups_on_content_id_and_created_at"
    t.index [nil, "created_at"], name: "index_groups_on_user_id_and_created_at"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.string "roles"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_roles_on_group_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "pictures"
    t.string "givenname"
    t.string "fullname"
    t.string "description"
    t.string "skype"
    t.date "dateofbirth"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
