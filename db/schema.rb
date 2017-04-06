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

ActiveRecord::Schema.define(version: 20170406052745) do

  create_table "department_informations", force: :cascade do |t|
    t.text     "name",                 limit: 65535
    t.integer  "parent_department_id", limit: 4
    t.text     "description",          limit: 65535
    t.integer  "layer",                limit: 4
    t.integer  "manager_id",           limit: 4
    t.integer  "vice_manager_id",      limit: 4
    t.text     "duty",                 limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "department_informations", ["manager_id"], name: "index_department_informations_on_manager_id", using: :btree
  add_index "department_informations", ["parent_department_id"], name: "index_department_informations_on_parent_department_id", using: :btree
  add_index "department_informations", ["vice_manager_id"], name: "index_department_informations_on_vice_manager_id", using: :btree

  create_table "person_informations", force: :cascade do |t|
    t.string   "person_name",    limit: 255
    t.string   "user_name",      limit: 255
    t.string   "gender",         limit: 255
    t.datetime "birthday"
    t.text     "description",    limit: 65535
    t.string   "phone_number",   limit: 255
    t.string   "email",          limit: 255
    t.string   "technical_post", limit: 255
    t.integer  "state",          limit: 4
    t.string   "password",       limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "process_informations", force: :cascade do |t|
    t.integer  "workflow_information_id", limit: 4
    t.string   "name",                    limit: 255
    t.text     "description",             limit: 65535
    t.integer  "creater_id",              limit: 4
    t.integer  "user_id",                 limit: 4
    t.boolean  "is_shared",               limit: 1
    t.integer  "parent_case_id",          limit: 4
    t.boolean  "persistent",              limit: 1
    t.text     "state",                   limit: 65535
    t.integer  "case_type",               limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "process_type",            limit: 255
    t.integer  "process_id",              limit: 4
  end

  add_index "process_informations", ["creater_id"], name: "index_process_informations_on_creater_id", using: :btree
  add_index "process_informations", ["parent_case_id"], name: "index_process_informations_on_parent_case_id", using: :btree
  add_index "process_informations", ["process_id"], name: "index_process_informations_on_process_id", using: :btree
  add_index "process_informations", ["process_type"], name: "index_process_informations_on_process_type_and_process_id", using: :btree
  add_index "process_informations", ["user_id"], name: "index_process_informations_on_user_id", using: :btree
  add_index "process_informations", ["workflow_information_id"], name: "index_process_informations_on_workflow_information_id", using: :btree

  create_table "shared_process_privileges", force: :cascade do |t|
    t.integer  "process_id",             limit: 4
    t.integer  "edit_department_id",     limit: 4
    t.integer  "execute_department_id",  limit: 4
    t.integer  "delete_department_id",   limit: 4
    t.boolean  "is_shared_sample_input", limit: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "shared_process_privileges", ["delete_department_id"], name: "index_shared_process_privileges_on_delete_department_id", using: :btree
  add_index "shared_process_privileges", ["edit_department_id"], name: "index_shared_process_privileges_on_edit_department_id", using: :btree
  add_index "shared_process_privileges", ["execute_department_id"], name: "index_shared_process_privileges_on_execute_department_id", using: :btree
  add_index "shared_process_privileges", ["process_id"], name: "index_shared_process_privileges_on_process_id", using: :btree

  create_table "test_algorithms", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.integer  "param1",                 limit: 4
    t.string   "param2",                 limit: 255
    t.string   "param3",                 limit: 255
    t.integer  "process_information_id", limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "test_algorithms", ["process_information_id"], name: "index_test_algorithms_on_process_information_id", using: :btree

  create_table "uplaod_files", force: :cascade do |t|
    t.text     "name",                   limit: 65535
    t.text     "path",                   limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "process_information_id", limit: 4
  end

  add_index "uplaod_files", ["process_information_id"], name: "index_uplaod_files_on_process_information_id", using: :btree

  create_table "upload_files", force: :cascade do |t|
    t.text     "name",                   limit: 65535
    t.text     "path",                   limit: 65535
    t.integer  "process_information_id", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "upload_files", ["process_information_id"], name: "index_upload_files_on_process_information_id", using: :btree

  create_table "workflow_categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "workflow_comments", force: :cascade do |t|
    t.string   "title",                   limit: 255
    t.text     "body",                    limit: 65535
    t.integer  "score",                   limit: 4
    t.integer  "author_id",               limit: 4
    t.integer  "comment_parent_id",       limit: 4
    t.integer  "workflow_information_id", limit: 4
    t.integer  "process_id",              limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "workflow_comments", ["author_id"], name: "index_workflow_comments_on_author_id", using: :btree
  add_index "workflow_comments", ["comment_parent_id"], name: "index_workflow_comments_on_comment_parent_id", using: :btree
  add_index "workflow_comments", ["process_id"], name: "index_workflow_comments_on_process_id", using: :btree
  add_index "workflow_comments", ["workflow_information_id"], name: "index_workflow_comments_on_workflow_information_id", using: :btree

  create_table "workflow_information_and_tags", force: :cascade do |t|
    t.integer  "workflow_information_id", limit: 4
    t.integer  "workflow_tag_id",         limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "workflow_information_and_tags", ["workflow_information_id"], name: "index_workflow_information_and_tags_on_workflow_information_id", using: :btree
  add_index "workflow_information_and_tags", ["workflow_tag_id"], name: "index_workflow_information_and_tags_on_workflow_tag_id", using: :btree

  create_table "workflow_informations", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.text     "introduction",           limit: 65535
    t.text     "detial_description",     limit: 65535
    t.text     "version_name",           limit: 65535
    t.integer  "category_id",            limit: 4
    t.integer  "tag_id",                 limit: 4
    t.integer  "author_id",              limit: 4
    t.integer  "last_editor_id",         limit: 4
    t.integer  "status",                 limit: 4
    t.datetime "createtime"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.boolean  "persistent",             limit: 1
    t.integer  "priority",               limit: 4
    t.integer  "most_possible_duration", limit: 4
    t.integer  "minimal_duration",       limit: 4
    t.integer  "maximal_duration",       limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "workflow_informations", ["author_id"], name: "index_workflow_informations_on_author_id", using: :btree
  add_index "workflow_informations", ["category_id"], name: "index_workflow_informations_on_category_id", using: :btree
  add_index "workflow_informations", ["last_editor_id"], name: "index_workflow_informations_on_last_editor_id", using: :btree
  add_index "workflow_informations", ["tag_id"], name: "index_workflow_informations_on_tag_id", using: :btree

  create_table "workflow_privileges", force: :cascade do |t|
    t.integer  "workflow_information_id", limit: 4
    t.integer  "edit_department_id",      limit: 4
    t.integer  "execute_department_id",   limit: 4
    t.integer  "delete_department_id",    limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "workflow_privileges", ["delete_department_id"], name: "index_workflow_privileges_on_delete_department_id", using: :btree
  add_index "workflow_privileges", ["edit_department_id"], name: "index_workflow_privileges_on_edit_department_id", using: :btree
  add_index "workflow_privileges", ["execute_department_id"], name: "index_workflow_privileges_on_execute_department_id", using: :btree
  add_index "workflow_privileges", ["workflow_information_id"], name: "index_workflow_privileges_on_workflow_information_id", using: :btree

  create_table "workflow_tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "upload_files", "process_informations"
end
