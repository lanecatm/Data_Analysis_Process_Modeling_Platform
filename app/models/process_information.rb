class ProcessInformation < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :last_editor, class_name: "User"
  belongs_to :parent, class_name: "ProcessInformation"
  belongs_to :category
  belongs_to :separator
  has_many :comments, foreign_key: "workflow_id"
  has_many :input_format
  has_many :output_format
  has_many :process_information, foreign_key: "parent"
  has_many :tag, class_name: "NullModel", foreign_key: "ref1"
  has_many :algorithm, class_name: "NullModel", foreign_key: "ref2"
  has_many :usecase, class_name: "NullModel", foreign_key: "ref3"
end
