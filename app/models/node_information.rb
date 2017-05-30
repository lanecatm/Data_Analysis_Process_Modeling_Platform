class NodeInformation < ActiveRecord::Base
  belongs_to :node_function
  belongs_to :workflow_information
  has_many :node_option_values, dependent: :destroy
end
