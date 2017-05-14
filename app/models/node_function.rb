class NodeFunction < ActiveRecord::Base
  belongs_to :node_type
  belongs_to :node_function
end
