class NodeFunction < ActiveRecord::Base
  belongs_to :node_type
  belongs_to :node_category
  has_many :node_options, dependent: :destroy, inverse_of: :node_function
  has_many :node_informations, dependent: :destroy
  accepts_nested_attributes_for :node_options, :reject_if => :all_blank, :allow_destroy => true
end
