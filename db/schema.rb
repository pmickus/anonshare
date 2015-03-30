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

ActiveRecord::Schema.define(version: 20150330125332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_logs", force: :cascade do |t|
    t.integer  "folder_id"
    t.string   "model_type"
    t.integer  "model_id"
    t.string   "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activity_logs", ["folder_id"], name: "index_activity_logs_on_folder_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["content_id"], name: "index_comments_on_content_id", using: :btree

  create_table "contents", force: :cascade do |t|
    t.string   "file_type"
    t.string   "uploaded_by"
    t.integer  "folder_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "contents", ["folder_id"], name: "index_contents_on_folder_id", using: :btree

  create_table "folders", force: :cascade do |t|
    t.string   "token"
    t.string   "name"
    t.integer  "filesize_limit"
    t.integer  "capacity"
    t.integer  "duration"
    t.datetime "expires_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
