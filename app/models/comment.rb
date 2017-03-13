class Comment < ActiveRecord::Base
  belongs_to :workflow, class_name: "process_information"
end
