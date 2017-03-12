class User < ActiveRecord::Base
  belongs_to :department
  has_many :process_information
end
