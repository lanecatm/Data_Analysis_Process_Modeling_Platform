class WikiAndWorkflowInformation < ActiveRecord::Base
  belongs_to :wiki_page
  belongs_to :workflow_information

end
