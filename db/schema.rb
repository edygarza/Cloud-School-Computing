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

ActiveRecord::Schema.define(:version => 20111011175544) do

  create_table "schools", :force => true do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.text     "description"
    t.text     "address"
    t.integer  "zip_code"
    t.text     "country"
    t.string   "telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.integer  "school_id"
    t.string   "registration_number"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "semester"
    t.date     "entry_date"
    t.string   "tutor"
    t.string   "tutor_address"
    t.string   "tutor_phone"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.text     "address"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
  end

  create_table "subjects", :force => true do |t|
    t.integer  "school_id"
    t.string   "key"
    t.string   "name"
    t.integer  "units"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "school_id"
    t.string   "username",                                           :null => false
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "home_phone"
    t.string   "office_phone"
    t.string   "cell_phone"
    t.text     "address"
    t.boolean  "admin",                           :default => false
    t.boolean  "director",                        :default => false
    t.boolean  "assistant",                       :default => false
    t.boolean  "teacher",                         :default => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
