class NodeOptionValue < ActiveRecord::Base
  belongs_to :node_option
  belongs_to :node_information
end
