class ProcessInformation < ActiveRecord::Base
  belongs_to :workflow_information
  belongs_to :creater, class_name: "PersonInformation"
  belongs_to :user, class_name: "PersonInformation"
  belongs_to :parent_case, class_name: "ProcessInformation"
  has_many :workflow_comments, foreign_key: "process"
  has_many :sub_cases, class_name: "ProcessInformation", foreign_key: "parent_case"

  has_one :upload_file
  has_one :download_file
  has_one :process_result
  has_one :test_algorithm
  has_one :shared_process_privilege, class_name: "SharedProcessPrivilege", foreign_key: "process_id"
end
