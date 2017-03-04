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

ActiveRecord::Schema.define(version: 20170220114552) do

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "score"
    t.datetime "createtime"
    t.integer  "process_information_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["process_information_id"], name: "index_comments_on_process_information_id"

  create_table "process_informations", force: :cascade do |t|
    t.string   "name"
    t.text     "introduction"
    t.string   "author"
    t.datetime "createtime"
    t.string   "version"
    t.string   "algorithm"
    t.text     "functional_description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "search_requests", force: :cascade do |t|
    t.string   "search_content"
    t.string   "search_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
