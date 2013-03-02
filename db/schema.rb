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

ActiveRecord::Schema.define(:version => 20130302065825) do

  create_table "ans", :force => true do |t|
    t.integer  "ans_id"
    t.string   "ans_content"
    t.string   "ans_title"
    t.string   "ans_url"
    t.date     "ans_date"
    t.integer  "ans_question_id"
    t.integer  "ans_use_id"
    t.string   "ans_pic"
    t.integer  "ans_id_bn"
    t.integer  "que_id_bn"
    t.date     "que_delete_datetime"
    t.string   "ans_ent_kbn"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "answers", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "answer_title"
    t.string   "answer_content"
    t.date     "answer_date"
    t.string   "answer_ent_kbn"
    t.integer  "answer_id"
    t.integer  "answer_id_bn"
    t.string   "answer_pic"
    t.integer  "answer_question_id"
    t.string   "answer_url"
    t.integer  "answer_user_id"
    t.integer  "question_id_bn"
  end

  create_table "ques", :force => true do |t|
    t.integer  "que_id"
    t.string   "que_content"
    t.string   "que_title"
    t.date     "que_due_date"
    t.date     "que_date_time"
    t.integer  "que_use_id"
    t.integer  "que_id_bn"
    t.string   "que_delete_datetime"
    t.string   "que_ent_kbn"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
