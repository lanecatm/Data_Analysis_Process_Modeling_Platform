class NodeCategory < ActiveRecord::Base
  belongs_to :node_type
  has_many :node_functions, dependent: :destroy
end
