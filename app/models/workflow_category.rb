class WorkflowCategory < ActiveRecord::Base
    has_many :workflow_informations, foreign_key: "category"
end
