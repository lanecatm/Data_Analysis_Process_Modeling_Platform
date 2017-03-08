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

ActiveRecord::Schema.define(version: 20170308063237) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "departments", ["parent_id"], name: "index_departments_on_parent_id"

  create_table "input_formats", force: :cascade do |t|
    t.integer  "column_index"
    t.string   "column_name"
    t.integer  "column_type_id"
    t.integer  "process_information_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "input_formats", ["column_type_id"], name: "index_input_formats_on_column_type_id"
  add_index "input_formats", ["process_information_id"], name: "index_input_formats_on_process_information_id"

  create_table "null_models", force: :cascade do |t|
    t.string   "name"
    t.integer  "ref1_id"
    t.integer  "ref2_id"
    t.integer  "ref3_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "null_models", ["ref1_id"], name: "index_null_models_on_ref1_id"
  add_index "null_models", ["ref2_id"], name: "index_null_models_on_ref2_id"
  add_index "null_models", ["ref3_id"], name: "index_null_models_on_ref3_id"

  create_table "output_formats", force: :cascade do |t|
    t.integer  "column_index"
    t.string   "column_name"
    t.integer  "column_type_id"
    t.integer  "process_information_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "output_formats", ["column_type_id"], name: "index_output_formats_on_column_type_id"
  add_index "output_formats", ["process_information_id"], name: "index_output_formats_on_process_information_id"

  create_table "process_informations", force: :cascade do |t|
    t.string   "name"
    t.text     "introduction"
    t.integer  "author_id"
    t.integer  "last_editor_id"
    t.datetime "createtime"
    t.datetime "edittime"
    t.string   "version"
    t.integer  "version_parent_id"
    t.integer  "category_id"
    t.text     "functional_description"
    t.integer  "separator_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status"
  end

  add_index "process_informations", ["author_id"], name: "index_process_informations_on_author_id"
  add_index "process_informations", ["category_id"], name: "index_process_informations_on_category_id"
  add_index "process_informations", ["last_editor_id"], name: "index_process_informations_on_last_editor_id"
  add_index "process_informations", ["separator_id"], name: "index_process_informations_on_separator_id"
  add_index "process_informations", ["version_parent_id"], name: "index_process_informations_on_version_parent_id"

  create_table "search_requests", force: :cascade do |t|
    t.string   "search_content"
    t.string   "search_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "separators", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "process_information_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "separators", ["process_information_id"], name: "index_separators_on_process_information_id"

  create_table "support_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users", ["department_id"], name: "index_users_on_department_id"

end
