class ProcessFile < ActiveRecord::Base
  belongs_to :process_information
  belongs_to :node
end
