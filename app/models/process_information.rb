class ProcessInformation < ActiveRecord::Base
  belongs_to :workflow_information
  belongs_to :creater
  belongs_to :user
  belongs_to :parent_case
end
