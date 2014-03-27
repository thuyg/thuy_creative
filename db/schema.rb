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

ActiveRecord::Schema.define(version: 20140325193902) do

  create_table "page_translations", force: true do |t|
    t.integer  "page_id",                                     null: false
    t.string   "locale",                                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "title",                            limit: 65
    t.string   "keyword"
    t.text     "description"
    t.string   "project_review_title"
    t.text     "project_review_short_description"
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale", using: :btree
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id", using: :btree

  create_table "page_types", force: true do |t|
    t.string   "name_tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer  "page_type_id"
    t.string   "name_tag"
    t.string   "permalink"
    t.integer  "position"
    t.boolean  "visible",            default: false
    t.string   "project_review_img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["page_type_id"], name: "index_pages_on_page_type_id", using: :btree
  add_index "pages", ["permalink"], name: "index_pages_on_permalink", using: :btree

  create_table "pages_sections", id: false, force: true do |t|
    t.integer "page_id"
    t.integer "section_id"
  end

  add_index "pages_sections", ["page_id", "section_id"], name: "index_pages_sections_on_page_id_and_section_id", using: :btree

  create_table "pages_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "page_id"
  end

  add_index "pages_users", ["user_id", "page_id"], name: "index_pages_users_on_user_id_and_page_id", using: :btree

  create_table "section_edits", force: true do |t|
    t.integer  "user_id"
    t.integer  "section_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "section_edits", ["user_id", "section_id"], name: "index_section_edits_on_user_id_and_section_id", using: :btree

  create_table "section_translations", force: true do |t|
    t.integer  "section_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  add_index "section_translations", ["locale"], name: "index_section_translations_on_locale", using: :btree
  add_index "section_translations", ["section_id"], name: "index_section_translations_on_section_id", using: :btree

  create_table "section_types", force: true do |t|
    t.string   "name_tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "section_type_id"
    t.string   "name_tag"
    t.integer  "position"
    t.boolean  "visible",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["section_type_id"], name: "index_sections_on_section_type_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 100, default: "", null: false
    t.string   "username",        limit: 25
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt",            limit: 40
    t.string   "password_digest"
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
