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

ActiveRecord::Schema.define(version: 20170515044523) do

  create_table "arff_types", force: :cascade do |t|
    t.text     "name",        limit: 65535
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "caseinformation", force: :cascade do |t|
    t.string   "ProcessID",     limit: 50,  default: "", null: false
    t.integer  "WorkflowID",    limit: 4,   default: 0,  null: false
    t.string   "CaseName",      limit: 50
    t.string   "KeyWords",      limit: 100
    t.integer  "InitiatorID",   limit: 4
    t.datetime "InitiatorDate"
  end

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

  create_table "download_files", force: :cascade do |t|
    t.text     "name",                   limit: 65535
    t.text     "path",                   limit: 65535
    t.integer  "process_information_id", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "download_files", ["process_information_id"], name: "index_download_files_on_process_information_id", using: :btree

  create_table "homeland_nodes", force: :cascade do |t|
    t.string   "name",         limit: 255,             null: false
    t.string   "description",  limit: 255
    t.string   "color",        limit: 255
    t.integer  "sort",         limit: 4,   default: 0, null: false
    t.integer  "topics_count", limit: 4,   default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "homeland_nodes", ["sort"], name: "index_homeland_nodes_on_sort", using: :btree

  create_table "homeland_replies", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "topic_id",    limit: 4
    t.text     "body",        limit: 65535
    t.text     "body_html",   limit: 65535
    t.datetime "deleted_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "reply_to_id", limit: 4
  end

  add_index "homeland_replies", ["reply_to_id"], name: "index_homeland_replies_on_reply_to_id", using: :btree
  add_index "homeland_replies", ["topic_id"], name: "index_homeland_replies_on_topic_id", using: :btree
  add_index "homeland_replies", ["user_id"], name: "index_homeland_replies_on_user_id", using: :btree

  create_table "homeland_topics", force: :cascade do |t|
    t.integer  "node_id",            limit: 4,                 null: false
    t.integer  "user_id",            limit: 4,                 null: false
    t.string   "title",              limit: 255,               null: false
    t.text     "body",               limit: 65535
    t.text     "body_html",          limit: 65535
    t.integer  "last_reply_id",      limit: 4
    t.integer  "last_reply_user_id", limit: 4
    t.integer  "last_active_mark",   limit: 4,     default: 0, null: false
    t.datetime "replied_at"
    t.integer  "replies_count",      limit: 4,     default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "homeland_topics", ["deleted_at"], name: "index_homeland_topics_on_deleted_at", using: :btree
  add_index "homeland_topics", ["last_active_mark", "deleted_at"], name: "index_homeland_topics_on_last_active_mark_and_deleted_at", using: :btree
  add_index "homeland_topics", ["node_id", "deleted_at"], name: "index_homeland_topics_on_node_id_and_deleted_at", using: :btree
  add_index "homeland_topics", ["node_id", "last_active_mark"], name: "index_homeland_topics_on_node_id_and_last_active_mark", using: :btree
  add_index "homeland_topics", ["user_id"], name: "index_homeland_topics_on_user_id", using: :btree

  create_table "javaclassmethod", force: :cascade do |t|
    t.integer "ApplicationID",  limit: 4,        default: 0, null: false
    t.string  "ClassName",      limit: 50
    t.text    "ClassURL",       limit: 16777215
    t.string  "MethodName",     limit: 100
    t.string  "UserName",       limit: 50
    t.string  "Password",       limit: 50
    t.integer "InputSchemaID",  limit: 4
    t.integer "OutputSchemaID", limit: 4
    t.integer "InputXMLID",     limit: 4
    t.integer "OutputXMLID",    limit: 4
  end

  create_table "node_categories", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "node_functions", force: :cascade do |t|
    t.text     "name",             limit: 65535
    t.text     "description",      limit: 65535
    t.integer  "node_type_id",     limit: 4
    t.integer  "node_function_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "node_functions", ["node_function_id"], name: "index_node_functions_on_node_function_id", using: :btree
  add_index "node_functions", ["node_type_id"], name: "index_node_functions_on_node_type_id", using: :btree

  create_table "node_option_choices", force: :cascade do |t|
    t.integer  "node_option_id", limit: 4
    t.text     "name",           limit: 65535
    t.text     "value",          limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "node_option_choices", ["node_option_id"], name: "index_node_option_choices_on_node_option_id", using: :btree

  create_table "node_option_types", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "node_options", force: :cascade do |t|
    t.integer  "node_function_id",    limit: 4
    t.integer  "node_index",          limit: 4
    t.text     "name",                limit: 65535
    t.text     "description",         limit: 65535
    t.text     "default_value",       limit: 65535
    t.integer  "node_option_type_id", limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "node_options", ["node_function_id"], name: "index_node_options_on_node_function_id", using: :btree
  add_index "node_options", ["node_option_type_id"], name: "index_node_options_on_node_option_type_id", using: :btree

  create_table "node_types", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "packageinformation", force: :cascade do |t|
    t.integer  "PackageID",    limit: 4,        default: 0, null: false
    t.string   "PackageName",  limit: 50
    t.text     "Description",  limit: 16777215
    t.string   "DurationUnit", limit: 1
    t.float    "CostUnit",     limit: 24
    t.integer  "AuthorID",     limit: 4
    t.datetime "CreateDate"
    t.string   "GoalOWLURI",   limit: 200
  end

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

  create_table "process_files", force: :cascade do |t|
    t.text     "name",                   limit: 65535
    t.text     "path",                   limit: 65535
    t.integer  "process_information_id", limit: 4
    t.integer  "node",                   limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "process_files", ["process_information_id"], name: "index_process_files_on_process_information_id", using: :btree

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

  create_table "process_results", force: :cascade do |t|
    t.text     "body",                   limit: 65535
    t.integer  "process_information_id", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "process_results", ["process_information_id"], name: "index_process_results_on_process_information_id", using: :btree

  create_table "processactivityinformation", force: :cascade do |t|
    t.string  "ProcessID",              limit: 50,  default: "", null: false
    t.integer "ActivityID",             limit: 4,   default: 0,  null: false
    t.string  "ActivityName",           limit: 50
    t.integer "ActivityType",           limit: 2
    t.integer "ActivityImplementation", limit: 2
    t.integer "Layer",                  limit: 2
    t.integer "ParentID",               limit: 4
    t.string  "Description",            limit: 100
    t.boolean "ChoiceManager",          limit: 1
    t.float   "StartTime",              limit: 24
    t.float   "Duration",               limit: 24
    t.integer "IconID",                 limit: 4
    t.text    "ActivityURL",            limit: 255
    t.integer "MultiPersonMode",        limit: 4
    t.integer "SubmitPersonNumber",     limit: 4
    t.integer "RepeatedTime",           limit: 2
    t.integer "TWCID",                  limit: 4
    t.string  "State",                  limit: 20
    t.boolean "isCallback",             limit: 1
  end

  create_table "processactivityinputmapping", force: :cascade do |t|
    t.string  "ProcessID",   limit: 50,       null: false
    t.integer "ActivityID",  limit: 4,        null: false
    t.integer "DataflowID",  limit: 4,        null: false
    t.text    "InputSchema", limit: 16777215
    t.text    "InputXML",    limit: 16777215
    t.text    "XSLT",        limit: 16777215
  end

  create_table "processactivityinvokingapplication", force: :cascade do |t|
    t.string   "ProcessID",       limit: 50, default: "", null: false
    t.integer  "ActivityID",      limit: 4,  default: 0,  null: false
    t.integer  "ApplicationID",   limit: 4,  default: 0,  null: false
    t.integer  "InvocationType",  limit: 2
    t.integer  "InputXMLID",      limit: 4
    t.integer  "OutputXMLID",     limit: 4
    t.datetime "ActualStartDate"
    t.datetime "ActualEndDate"
    t.string   "Result",          limit: 1
  end

  create_table "processapplication", force: :cascade do |t|
    t.string  "ProcessID",     limit: 50, default: "", null: false
    t.integer "ApplicationID", limit: 2,  default: 0,  null: false
    t.string  "Description",   limit: 50, default: ""
  end

  create_table "processcondition", force: :cascade do |t|
    t.string  "ProcessID",               limit: 50,  default: "", null: false
    t.integer "ConditionID",             limit: 4,   default: 0,  null: false
    t.string  "ConditionRepresentation", limit: 200
    t.string  "ConditionName",           limit: 50
  end

  create_table "processcontrolflowcondition", force: :cascade do |t|
    t.string  "ProcessID",     limit: 50, default: "0", null: false
    t.integer "ControlFlowID", limit: 2,  default: 0,   null: false
    t.integer "ConditionID",   limit: 2,  default: 0,   null: false
  end

  create_table "processevent", force: :cascade do |t|
    t.string   "ProcessID",           limit: 50,         default: "", null: false
    t.integer  "EventID",             limit: 4,          default: 0,  null: false
    t.text     "EventRepresentation", limit: 4294967295
    t.text     "ExpressionforParse",  limit: 4294967295
    t.integer  "EventType",           limit: 2
    t.integer  "LogicType",           limit: 2
    t.integer  "ActivityID",          limit: 4
    t.integer  "RepeatedTime",        limit: 2
    t.datetime "ActiveTime"
    t.string   "EventName",           limit: 20
    t.string   "Description",         limit: 100
  end

  create_table "processflow", force: :cascade do |t|
    t.integer "ModelType",      limit: 2,  default: 0,   null: false
    t.string  "ProcessID",      limit: 50, default: "0", null: false
    t.integer "FlowID",         limit: 4,  default: 0,   null: false
    t.integer "ParentID",       limit: 4
    t.integer "Type",           limit: 2,  default: 0,   null: false
    t.integer "FromObjectType", limit: 2,  default: 0,   null: false
    t.integer "ObjectId1",      limit: 4,  default: 0,   null: false
    t.integer "ToObjectType",   limit: 2,  default: 0,   null: false
    t.integer "ObjectID2",      limit: 4,  default: 0,   null: false
  end

  create_table "processflowobjectcontrol", force: :cascade do |t|
    t.string   "ProcessID",    limit: 50, default: "", null: false
    t.integer  "FlowID",       limit: 4,  default: 0,  null: false
    t.integer  "ObjectID",     limit: 4,  default: 0,  null: false
    t.integer  "Privilege",    limit: 2
    t.integer  "RepeatedTime", limit: 2
    t.datetime "ActiveTime"
    t.string   "State",        limit: 50
  end

  create_table "processflowobjects", force: :cascade do |t|
    t.integer "DroolsRuleID",   limit: 4,          default: 0,  null: false
    t.string  "ProcessID",      limit: 50,         default: "", null: false
    t.integer "FlowID",         limit: 4,          default: 0,  null: false
    t.integer "FromActivityID", limit: 4,          default: 0,  null: false
    t.integer "ToActivityID",   limit: 4,          default: 0,  null: false
    t.text    "XSLTO2M",        limit: 4294967295
    t.text    "XSLTM2I",        limit: 4294967295
    t.integer "OXMLID",         limit: 4
    t.integer "MXMLID",         limit: 4
    t.integer "IXMLID",         limit: 4
  end

  create_table "processinformation", force: :cascade do |t|
    t.string  "ProcessID",    limit: 50,  default: "", null: false
    t.string  "ProcessName",  limit: 50
    t.integer "Source",       limit: 2
    t.integer "CaseType",     limit: 2
    t.string  "ParentCaseID", limit: 50
    t.integer "MaximalLayer", limit: 2
    t.string  "Description",  limit: 100
    t.boolean "Persistent",   limit: 1
    t.string  "State",        limit: 20
    t.string  "DurationUnit", limit: 1
    t.float   "CostUnit",     limit: 24
    t.integer "TWCID",        limit: 4
  end

  create_table "processinherentvariable", force: :cascade do |t|
    t.string  "ProcessID",    limit: 50, default: "", null: false
    t.integer "ObjectID",     limit: 4,  default: 0,  null: false
    t.string  "ObjectName",   limit: 50
    t.string  "Description",  limit: 50
    t.integer "ValueType",    limit: 2
    t.string  "InitialValue", limit: 50
    t.string  "Value",        limit: 50
  end

  create_table "processlogs", force: :cascade do |t|
    t.string  "ProcessID", limit: 50,    null: false
    t.text    "log",       limit: 65535
    t.integer "starttime", limit: 8
    t.integer "endtime",   limit: 8
    t.integer "idletime",  limit: 8
  end

  create_table "processobject", force: :cascade do |t|
    t.string  "ProcessID",       limit: 50, default: "", null: false
    t.integer "ObjectID",        limit: 4,  default: 0,  null: false
    t.string  "ObjectName",      limit: 50
    t.boolean "ISInput",         limit: 1
    t.boolean "ISOutput",        limit: 1
    t.boolean "ISVisible",       limit: 1
    t.integer "ObjectType",      limit: 2
    t.integer "Scope",           limit: 2
    t.integer "PackageObjectID", limit: 2
    t.integer "State",           limit: 2
  end

  create_table "processprocessecarule", force: :cascade do |t|
    t.string   "ProcessID",              limit: 50,  default: "", null: false
    t.integer  "RuleID",                 limit: 4,   default: 0,  null: false
    t.integer  "EventID",                limit: 4,   default: 0,  null: false
    t.integer  "ConditionID",            limit: 4,   default: 0,  null: false
    t.string   "ActionExpression",       limit: 200
    t.float    "Probability",            limit: 24
    t.float    "ProbabilityCoefficient", limit: 24
    t.datetime "ActiveTime"
    t.integer  "RepeatedTime",           limit: 2
  end

  create_table "processrepeatedinformation", force: :cascade do |t|
    t.string   "ProcessID",    limit: 50
    t.integer  "RepeatedType", limit: 2
    t.integer  "RepeatedID1",  limit: 4
    t.integer  "RepeatedID2",  limit: 4
    t.integer  "RepeatedTime", limit: 2
    t.datetime "StartTime"
    t.datetime "EndTime"
    t.string   "Parameter1",   limit: 50
    t.string   "Parameter2",   limit: 50
    t.string   "Parameter3",   limit: 50
  end

  create_table "separators", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.text     "value",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

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

  create_table "systemapplicationinformation", force: :cascade do |t|
    t.integer "ApplicationID",   limit: 4,          default: 0, null: false
    t.text    "Description",     limit: 4294967295
    t.string  "ApplicationName", limit: 100
    t.integer "ApplicationType", limit: 2
    t.integer "InputSchemaID",   limit: 4
    t.integer "OutputSchemaID",  limit: 4
  end

  create_table "systemschema", force: :cascade do |t|
    t.integer "SchemaID",    limit: 4,        default: 0, null: false
    t.string  "SchemaName",  limit: 100
    t.text    "description", limit: 16777215
    t.text    "SchemaText",  limit: 16777215
    t.integer "SchemaType",  limit: 4,                    null: false
  end

  create_table "systemxmldocument", force: :cascade do |t|
    t.integer "ObjectID",     limit: 4
    t.string  "ObjectName",   limit: 50
    t.string  "Description",  limit: 50
    t.integer "FromSchemaID", limit: 4
    t.text    "XML",          limit: 16777215
  end

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

  create_table "upload_files", force: :cascade do |t|
    t.text     "name",                   limit: 65535
    t.text     "path",                   limit: 65535
    t.integer  "process_information_id", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "upload_files", ["process_information_id"], name: "index_upload_files_on_process_information_id", using: :btree

  create_table "user_pictures", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.text     "path",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "user_pictures", ["user_id"], name: "index_user_pictures_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "user_name",              limit: 255, default: "", null: false
    t.string   "person_name",            limit: 255
    t.string   "gender",                 limit: 255
    t.datetime "birthday"
    t.string   "phone_number",           limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wiki_page_versions", force: :cascade do |t|
    t.integer  "page_id",    limit: 4,          null: false
    t.integer  "updator_id", limit: 4
    t.integer  "number",     limit: 4
    t.string   "comment",    limit: 255
    t.string   "path",       limit: 255
    t.string   "title",      limit: 255
    t.text     "content",    limit: 4294967295
    t.datetime "updated_at"
  end

  add_index "wiki_page_versions", ["page_id"], name: "index_wiki_page_versions_on_page_id", using: :btree
  add_index "wiki_page_versions", ["updator_id"], name: "index_wiki_page_versions_on_updator_id", using: :btree

  create_table "wiki_pages", force: :cascade do |t|
    t.integer  "creator_id", limit: 4
    t.integer  "updator_id", limit: 4
    t.string   "path",       limit: 255
    t.string   "title",      limit: 255
    t.text     "content",    limit: 4294967295
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wiki_pages", ["creator_id"], name: "index_wiki_pages_on_creator_id", using: :btree
  add_index "wiki_pages", ["path"], name: "index_wiki_pages_on_path", unique: true, using: :btree

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

  create_table "workflowactivityinformation", force: :cascade do |t|
    t.integer "WorkflowID",             limit: 4
    t.integer "ActivityID",             limit: 4
    t.string  "ActivityName",           limit: 50
    t.integer "Layer",                  limit: 2
    t.integer "ParentID",               limit: 4
    t.boolean "IsComposite",            limit: 1
    t.text    "Description",            limit: 16777215
    t.boolean "ChoiceManager",          limit: 1,        null: false
    t.integer "ActivityType",           limit: 2
    t.integer "ActivityImplementation", limit: 2
    t.float   "StartTime",              limit: 24
    t.float   "Duration",               limit: 24
    t.integer "IconID",                 limit: 2
    t.text    "ActivityURL",            limit: 16777215
    t.integer "MultiPersonMode",        limit: 2
    t.integer "SubmitPersonNumber",     limit: 2
    t.integer "TWCID",                  limit: 4
    t.boolean "IsCallback",             limit: 1
    t.string  "ObjectList",             limit: 50
  end

  create_table "workflowactivityinputmapping", force: :cascade do |t|
    t.integer "WorkflowID",  limit: 4,        null: false
    t.integer "ActivityID",  limit: 4,        null: false
    t.integer "DataflowID",  limit: 4,        null: false
    t.text    "InputSchema", limit: 16777215
    t.text    "InputXML",    limit: 16777215
    t.text    "XSLT",        limit: 16777215
  end

  create_table "workflowactivityinvokingapplication", force: :cascade do |t|
    t.integer "WorkflowID",     limit: 4, default: 0, null: false
    t.integer "ActivityID",     limit: 4, default: 0, null: false
    t.integer "ApplicationID",  limit: 4, default: 0, null: false
    t.integer "InvocationType", limit: 2
    t.integer "InputSchemaID",  limit: 4
    t.integer "OutputSchemaID", limit: 4
  end

  create_table "workflowapplication", force: :cascade do |t|
    t.integer "WorkflowID",    limit: 4,  default: 0,   null: false
    t.integer "ApplicationID", limit: 2,  default: 0,   null: false
    t.string  "Description",   limit: 50, default: "0"
  end

  create_table "workflowcondition", force: :cascade do |t|
    t.integer "WorkflowID",              limit: 4,   default: 0, null: false
    t.integer "ConditionID",             limit: 4,   default: 0, null: false
    t.string  "ConditionRepresentation", limit: 200
    t.string  "ConditionName",           limit: 50
  end

  create_table "workflowcontrolflowcondition", force: :cascade do |t|
    t.integer "WorkflowID",    limit: 2, default: 0, null: false
    t.integer "ControlFlowID", limit: 2, default: 0, null: false
    t.integer "ConditionID",   limit: 2, default: 0, null: false
  end

  create_table "workflowevent", force: :cascade do |t|
    t.integer "WorkflowID",          limit: 4,          default: 0, null: false
    t.integer "EventID",             limit: 4,          default: 0, null: false
    t.string  "EventName",           limit: 50
    t.string  "Description",         limit: 100
    t.text    "EventRepresentation", limit: 4294967295
    t.integer "EventType",           limit: 2
    t.integer "LogicType",           limit: 2
    t.integer "ActivityID",          limit: 4
  end

  create_table "workflowflow", force: :cascade do |t|
    t.integer "ModelType",      limit: 2, default: 0, null: false
    t.integer "WorkflowID",     limit: 4, default: 0, null: false
    t.integer "FlowID",         limit: 4, default: 0, null: false
    t.integer "ParentID",       limit: 4
    t.integer "Type",           limit: 2, default: 0, null: false
    t.integer "FromObjectType", limit: 2, default: 0, null: false
    t.integer "ObjectId1",      limit: 4, default: 0, null: false
    t.integer "ToObjectType",   limit: 2, default: 0, null: false
    t.integer "ObjectID2",      limit: 4, default: 0, null: false
  end

  create_table "workflowflowobjectcontrol", force: :cascade do |t|
    t.integer "WorkflowID", limit: 4, default: 0, null: false
    t.integer "FlowID",     limit: 4, default: 0, null: false
    t.integer "ObjectID",   limit: 2, default: 0, null: false
    t.integer "Privilege",  limit: 2
    t.integer "ObjectType", limit: 4
  end

  create_table "workflowflowobjects", force: :cascade do |t|
    t.integer "WorkflowID",     limit: 4,          default: 0, null: false
    t.integer "FlowID",         limit: 4,          default: 0, null: false
    t.integer "DroolsRuleID",   limit: 4
    t.integer "FromActivityID", limit: 4
    t.integer "ToActivityID",   limit: 4
    t.text    "XSLTO2M",        limit: 4294967295
    t.text    "XSLTM2I",        limit: 4294967295
    t.integer "OXMLID",         limit: 4
    t.integer "MXMLID",         limit: 4
    t.integer "IXMLID",         limit: 4
  end

  create_table "workflowinherentvariable", force: :cascade do |t|
    t.integer "WorkflowID",   limit: 4,  default: 0, null: false
    t.integer "ObjectID",     limit: 4,  default: 0, null: false
    t.string  "ObjectName",   limit: 50
    t.string  "Description",  limit: 50
    t.integer "ValueType",    limit: 2
    t.string  "InitialValue", limit: 50
  end

  create_table "workflowobject", force: :cascade do |t|
    t.string  "WorkflowID",      limit: 50
    t.integer "ObjectID",        limit: 4
    t.string  "ObjectName",      limit: 100
    t.boolean "ISInput",         limit: 1
    t.boolean "ISOutput",        limit: 1
    t.boolean "ISVisible",       limit: 1
    t.integer "ObjectType",      limit: 2
    t.integer "Scope",           limit: 2
    t.integer "PackageObjectID", limit: 2
  end

  create_table "workflowprocessecarule", force: :cascade do |t|
    t.integer "WorkflowID",             limit: 4,   default: 0, null: false
    t.integer "RuleID",                 limit: 4,   default: 0, null: false
    t.integer "EventID",                limit: 4,   default: 0, null: false
    t.integer "ConditionID",            limit: 4,   default: 0, null: false
    t.string  "ActionExpression",       limit: 200
    t.float   "Probability",            limit: 24
    t.float   "ProbabilityCoefficient", limit: 24
  end

  add_foreign_key "download_files", "process_informations"
  add_foreign_key "node_functions", "node_functions"
  add_foreign_key "node_functions", "node_types"
  add_foreign_key "node_option_choices", "node_options"
  add_foreign_key "node_options", "node_functions"
  add_foreign_key "node_options", "node_option_types"
  add_foreign_key "process_files", "process_informations"
  add_foreign_key "process_results", "process_informations"
  add_foreign_key "upload_files", "process_informations"
  add_foreign_key "user_pictures", "users"
end
