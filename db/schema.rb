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

ActiveRecord::Schema.define(:version => 20120428045515) do

  create_table "demographics", :force => true do |t|
    t.integer  "participant_id"
    t.integer  "gender"
    t.integer  "age"
    t.string   "ethnicity"
    t.string   "major"
    t.integer  "year_university"
    t.float    "gpa"
    t.string   "country_of_residence"
    t.string   "country_of_birth"
    t.string   "country_of_schooling"
    t.boolean  "native_english"
    t.string   "native_language"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "graphics", :force => true do |t|
    t.integer  "participant_id"
    t.integer  "graphics_ki"
    t.text     "graphics_ki_text"
    t.integer  "graphics_kt"
    t.text     "graphics_kt_text"
    t.integer  "graphics_it"
    t.text     "graphics_it_text"
    t.text     "k_def"
    t.text     "i_def"
    t.text     "t_def"
    t.text     "kit"
    t.text     "context"
    t.text     "domain"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "step",             :default => 0
  end

  create_table "participants", :force => true do |t|
    t.string   "session_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "instructor"
    t.string   "country"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "current_question", :default => 0
  end

  create_table "searches", :force => true do |t|
    t.integer  "participant_id"
    t.integer  "d_know_astro"
    t.integer  "d_know_psyc"
    t.integer  "t_know_astro"
    t.integer  "t_know_psyc"
    t.integer  "d_interest_astro"
    t.integer  "d_interest_psyc"
    t.integer  "t_interest_astro"
    t.integer  "t_interest_psyc"
    t.integer  "confidence_discrete"
    t.integer  "confidence_open"
    t.text     "answer_discrete"
    t.text     "answer_open"
    t.text     "confidencewhy_discrete"
    t.text     "confidencewhy_open"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "step",                   :default => 0
    t.integer  "ad_test"
  end

end
