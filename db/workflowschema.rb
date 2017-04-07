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

ActiveRecord::Schema.define(version: 0) do

  create_table "caseinformation", force: :cascade do |t|
    t.string   "ProcessID",     limit: 50,  default: "", null: false
    t.integer  "WorkflowID",    limit: 4,   default: 0,  null: false
    t.string   "CaseName",      limit: 50
    t.string   "KeyWords",      limit: 100
    t.integer  "InitiatorID",   limit: 4
    t.datetime "InitiatorDate"
  end

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

  create_table "workflowinformation", force: :cascade do |t|
    t.integer  "WorkflowID",           limit: 4,        default: 0, null: false
    t.integer  "WorkflowType",         limit: 2,        default: 0, null: false
    t.integer  "ParentWorkflowID",     limit: 4
    t.integer  "PackageID",            limit: 4,        default: 0, null: false
    t.string   "WorkflowName",         limit: 100
    t.text     "Description",          limit: 16777215
    t.integer  "MaximalLayer",         limit: 4
    t.datetime "CreateDate"
    t.datetime "ValidFrom"
    t.datetime "ValidTo"
    t.boolean  "Persistent",           limit: 1
    t.integer  "Priority",             limit: 2
    t.integer  "AuthorID",             limit: 4
    t.integer  "MostPossibleDuration", limit: 4
    t.integer  "MinimalDuration",      limit: 4
    t.integer  "MaximalDuration",      limit: 4
    t.integer  "TWCID",                limit: 4
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

end
