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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120907010948) do

  create_table "clients", :force => true do |t|
    t.string   "email",      :null => false
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "department"
  end

  create_table "histories", :force => true do |t|
    t.integer  "issue_id",      :null => false
    t.integer  "staff_id",      :null => false
    t.text     "reply",         :null => false
    t.integer  "old_status_id"
    t.integer  "new_status_id"
    t.integer  "old_owner_id"
    t.integer  "new_owner_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "issues", :force => true do |t|
    t.text     "subject",     :null => false
    t.text     "description", :null => false
    t.string   "reference",   :null => false
    t.integer  "client_id",   :null => false
    t.integer  "owner_id"
    t.integer  "status_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "access_hash", :null => false
  end

  create_table "staffs", :force => true do |t|
    t.string   "email",                                  :null => false
    t.string   "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "staffs", ["email"], :name => "index_staffs_on_email", :unique => true
  add_index "staffs", ["reset_password_token"], :name => "index_staffs_on_reset_password_token", :unique => true

  create_table "statuses", :force => true do |t|
    t.string   "kind",       :null => false
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
