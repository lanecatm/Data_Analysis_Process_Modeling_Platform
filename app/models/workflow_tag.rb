class WorkflowTag < ActiveRecord::Base
    has_many :workflow_information_and_tags
    has_many :workflow_informations, :through => :workflow_information_and_tags
end
