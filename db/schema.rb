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

ActiveRecord::Schema.define(:version => 20120501160642) do

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

  create_table "questionaires", :force => true do |t|
    t.integer  "q0"
    t.integer  "q1"
    t.integer  "q2"
    t.integer  "q3"
    t.integer  "q4"
    t.integer  "q5"
    t.integer  "q6"
    t.integer  "q7"
    t.integer  "q8"
    t.integer  "q9"
    t.integer  "q10"
    t.integer  "q11"
    t.integer  "q12"
    t.integer  "q13"
    t.integer  "q14"
    t.integer  "q15"
    t.integer  "q16"
    t.integer  "q17"
    t.integer  "q18"
    t.integer  "q19"
    t.integer  "q20"
    t.integer  "q21"
    t.integer  "q22"
    t.integer  "q23"
    t.integer  "q24"
    t.integer  "q25"
    t.integer  "q26"
    t.integer  "q27"
    t.integer  "q28"
    t.integer  "q29"
    t.integer  "q30"
    t.integer  "q31"
    t.integer  "q32"
    t.integer  "q33"
    t.integer  "q34"
    t.integer  "q35"
    t.integer  "q36"
    t.integer  "q37"
    t.integer  "q38"
    t.integer  "q39"
    t.integer  "q40"
    t.integer  "q41"
    t.integer  "q42"
    t.integer  "q43"
    t.integer  "q44"
    t.integer  "q45"
    t.integer  "q46"
    t.integer  "q47"
    t.integer  "q48"
    t.integer  "q49"
    t.integer  "q50"
    t.integer  "q51"
    t.integer  "q52"
    t.integer  "q53"
    t.integer  "q54"
    t.integer  "q55"
    t.integer  "q56"
    t.integer  "q57"
    t.integer  "q58"
    t.integer  "q59"
    t.integer  "q60"
    t.integer  "q61"
    t.integer  "q62"
    t.integer  "q63"
    t.integer  "q64"
    t.integer  "q65"
    t.integer  "q66"
    t.integer  "q67"
    t.integer  "q68"
    t.integer  "q69"
    t.integer  "q70"
    t.integer  "q71"
    t.integer  "q72"
    t.integer  "q73"
    t.integer  "q74"
    t.integer  "q75"
    t.integer  "q76"
    t.integer  "q77"
    t.integer  "q78"
    t.integer  "q79"
    t.integer  "q80"
    t.integer  "q81"
    t.text     "context1"
    t.text     "context2"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "participant_id"
    t.integer  "step",           :default => 0
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

  create_table "source_evaluations", :force => true do |t|
    t.integer  "search_id"
    t.integer  "familiarity"
    t.integer  "utility"
    t.integer  "accessibility"
    t.integer  "trust"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "source_id"
  end

end
