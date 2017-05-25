class NodeOptionValue < ActiveRecord::Base
  belongs_to :node_option
  belongs_to :workflow_information
  belongs_to :node_attribute
end
