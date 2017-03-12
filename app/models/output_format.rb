class OutputFormat < ActiveRecord::Base
  belongs_to :column_type, class_name: "SupportType"
  belongs_to :process_information
end
