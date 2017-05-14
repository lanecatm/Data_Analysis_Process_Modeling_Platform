class NodeOption < ActiveRecord::Base
  belongs_to :node_function
  belongs_to :node_option_type
end
