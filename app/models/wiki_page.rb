class WikiPage < ActiveRecord::Base
    acts_as_wiki_page
    has_one :task_category_and_wiki
    has_many :task_category, :through => :task_category_and_wiki
    has_many :wiki_and_workflow_informations, dependent: :destroy
end
