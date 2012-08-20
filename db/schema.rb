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

ActiveRecord::Schema.define(:version => 20120820020936) do

  create_table "pics", :force => true do |t|
    t.string   "url"
    t.integer  "full_top"
    t.integer  "full_bottom"
    t.integer  "full_left"
    t.integer  "full_right"
    t.integer  "face_top"
    t.integer  "face_bottom"
    t.integer  "face_left"
    t.integer  "face_right"
    t.string   "gender"
    t.integer  "age"
    t.decimal  "weight"
    t.decimal  "physique"
    t.string   "skin_color"
    t.string   "race"
    t.string   "hair_color"
    t.string   "hair_length"
    t.string   "hair_style"
    t.string   "eye_color"
    t.string   "clothes"
    t.string   "makeup"
    t.string   "accessories"
    t.string   "emotion"
    t.string   "tags"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "height"
    t.integer  "img_height"
    t.integer  "img_width"
  end

end
