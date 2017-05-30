class NodeOption < ActiveRecord::Base
  belongs_to :node_function
  belongs_to :node_option_type

  has_many :node_option_choices, dependent: :destroy, inverse_of: :node_option
  accepts_nested_attributes_for :node_option_choices, :reject_if => :all_blank, :allow_destroy => true

end
