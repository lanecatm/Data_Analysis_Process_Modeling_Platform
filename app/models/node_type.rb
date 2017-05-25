class NodeType < ActiveRecord::Base
    has_many :node_categories, dependent: :destroy
end
