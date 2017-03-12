class SupportType < ActiveRecord::Base
    has_many :input_format, foreign_key: "column_type"
    has_many :output_format, foreign_key: "column_type"
end
