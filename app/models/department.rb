class Department < ActiveRecord::Base
  belongs_to :parent, class_name: "Department"
  has_many :sons, class_name: "Department", foreign_key: "parent"
  has_many :user
end
