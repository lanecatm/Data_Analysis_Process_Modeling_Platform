class NullModel < ActiveRecord::Base
  belongs_to :ref1, class_name: "ProcessInformation"
  belongs_to :ref2, class_name: "ProcessInformation"
  belongs_to :ref3, class_name: "ProcessInformation"
end
