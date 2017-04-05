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

ActiveRecord::Schema.define(version: 20170405053607) do

  create_table "department_informations", force: :cascade do |t|
    t.text     "name"
    t.integer  "parent_department_id"
    t.text     "description"
    t.integer  "layer"
    t.integer  "manager_id"
    t.integer  "vice_manager_id"
    t.text     "duty"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "department_informations", ["manager_id"], name: "index_department_informations_on_manager_id"
  add_index "department_informations", ["parent_department_id"], name: "index_department_informations_on_parent_department_id"
  add_index "department_informations", ["vice_manager_id"], name: "index_department_informations_on_vice_manager_id"

  create_table "person_informations", force: :cascade do |t|
    t.string   "person_name"
    t.string   "user_name"
    t.string   "gender"
    t.datetime "birthday"
    t.text     "description"
    t.string   "phone_number"
    t.string   "email"
    t.string   "technical_post"
    t.integer  "state"
    t.string   "password"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "process_informations", force: :cascade do |t|
    t.integer  "workflow_information_id"
    t.string   "name"
    t.text     "description"
    t.integer  "creater_id"
    t.integer  "user_id"
    t.boolean  "is_shared"
    t.integer  "parent_case_id"
    t.boolean  "persistent"
    t.text     "state"
    t.integer  "case_type"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "process_type"
    t.integer  "process_id"
  end

  add_index "process_informations", ["creater_id"], name: "index_process_informations_on_creater_id"
  add_index "process_informations", ["parent_case_id"], name: "index_process_informations_on_parent_case_id"
  add_index "process_informations", ["process_id"], name: "index_process_informations_on_process_id"
  add_index "process_informations", ["process_type"], name: "index_process_informations_on_process_type_and_process_id"
  add_index "process_informations", ["user_id"], name: "index_process_informations_on_user_id"
  add_index "process_informations", ["workflow_information_id"], name: "index_process_informations_on_workflow_information_id"

  create_table "shared_process_privileges", force: :cascade do |t|
    t.integer  "process_id"
    t.integer  "edit_department_id"
    t.integer  "execute_department_id"
    t.integer  "delete_department_id"
    t.boolean  "isSharedSampleInput"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "shared_process_privileges", ["delete_department_id"], name: "index_shared_process_privileges_on_delete_department_id"
  add_index "shared_process_privileges", ["edit_department_id"], name: "index_shared_process_privileges_on_edit_department_id"
  add_index "shared_process_privileges", ["execute_department_id"], name: "index_shared_process_privileges_on_execute_department_id"
  add_index "shared_process_privileges", ["process_id"], name: "index_shared_process_privileges_on_process_id"

  create_table "test_algorithms", force: :cascade do |t|
    t.string   "name"
    t.integer  "param1"
    t.string   "param2"
    t.string   "param3"
    t.integer  "process_information_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "test_algorithms", ["process_information_id"], name: "index_test_algorithms_on_process_information_id"

  create_table "uplaod_files", force: :cascade do |t|
    t.text     "name"
    t.text     "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workflow_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "workflow_comments", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "score"
    t.integer  "author_id"
    t.integer  "comment_parent_id"
    t.integer  "workflow_information_id"
    t.integer  "process_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "workflow_comments", ["author_id"], name: "index_workflow_comments_on_author_id"
  add_index "workflow_comments", ["comment_parent_id"], name: "index_workflow_comments_on_comment_parent_id"
  add_index "workflow_comments", ["process_id"], name: "index_workflow_comments_on_process_id"
  add_index "workflow_comments", ["workflow_information_id"], name: "index_workflow_comments_on_workflow_information_id"

  create_table "workflow_information_and_tags", force: :cascade do |t|
    t.integer  "workflow_information_id"
    t.integer  "workflow_tag_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "workflow_information_and_tags", ["workflow_information_id"], name: "index_workflow_information_and_tags_on_workflow_information_id"
  add_index "workflow_information_and_tags", ["workflow_tag_id"], name: "index_workflow_information_and_tags_on_workflow_tag_id"

  create_table "workflow_informations", force: :cascade do |t|
    t.string   "name"
    t.text     "introduction"
    t.text     "detial_description"
    t.text     "version_name"
    t.integer  "category_id"
    t.integer  "tag_id"
    t.integer  "author_id"
    t.integer  "last_editor_id"
    t.integer  "status"
    t.datetime "createtime"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.boolean  "persistent"
    t.integer  "priority"
    t.integer  "most_possible_duration"
    t.integer  "minimal_duration"
    t.integer  "maximal_duration"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "workflow_informations", ["author_id"], name: "index_workflow_informations_on_author_id"
  add_index "workflow_informations", ["category_id"], name: "index_workflow_informations_on_category_id"
  add_index "workflow_informations", ["last_editor_id"], name: "index_workflow_informations_on_last_editor_id"
  add_index "workflow_informations", ["tag_id"], name: "index_workflow_informations_on_tag_id"

  create_table "workflow_privileges", force: :cascade do |t|
    t.integer  "workflow_information_id"
    t.integer  "edit_department_id"
    t.integer  "execute_department_id"
    t.integer  "delete_department_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "workflow_privileges", ["delete_department_id"], name: "index_workflow_privileges_on_delete_department_id"
  add_index "workflow_privileges", ["edit_department_id"], name: "index_workflow_privileges_on_edit_department_id"
  add_index "workflow_privileges", ["execute_department_id"], name: "index_workflow_privileges_on_execute_department_id"
  add_index "workflow_privileges", ["workflow_information_id"], name: "index_workflow_privileges_on_workflow_information_id"

  create_table "workflow_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
