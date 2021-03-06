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

ActiveRecord::Schema.define(version: 20140126204345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: true do |t|
    t.integer  "template_id"
    t.string   "title"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completion_days", force: true do |t|
    t.integer  "template_id"
    t.string   "title"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "number_of_pages", force: true do |t|
    t.integer  "template_id"
    t.string   "title"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.string   "template_name"
    t.string   "status"
    t.string   "total_price"
    t.integer  "template_price"
    t.string   "complete_day"
    t.integer  "complete_day_price"
    t.string   "number_of_page"
    t.integer  "page_price"
    t.string   "color"
    t.integer  "color_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "settings", force: true do |t|
    t.string   "account_type"
    t.string   "access_key"
    t.string   "secret_access"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templates", force: true do |t|
    t.string   "name"
    t.text     "short_description"
    t.text     "detail_description"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string   "slider1_file_name"
    t.string   "slider1_content_type"
    t.integer  "slider1_file_size"
    t.datetime "slider1_updated_at"
    t.string   "slider2_file_name"
    t.string   "slider2_content_type"
    t.integer  "slider2_file_size"
    t.datetime "slider2_updated_at"
    t.string   "slider3_file_name"
    t.string   "slider3_content_type"
    t.integer  "slider3_file_size"
    t.datetime "slider3_updated_at"
    t.string   "slider4_file_name"
    t.string   "slider4_content_type"
    t.integer  "slider4_file_size"
    t.datetime "slider4_updated_at"
    t.string   "offer_name"
    t.integer  "offer_discount"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visitors", force: true do |t|
    t.string   "email_id"
    t.string   "template_name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
