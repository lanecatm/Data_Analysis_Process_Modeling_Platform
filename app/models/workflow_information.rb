class WorkflowInformation < ActiveRecord::Base
  belongs_to :category
  belongs_to :tag
  belongs_to :author
  belongs_to :last_editor
end
