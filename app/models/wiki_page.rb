class WikiPage < ActiveRecord::Base
    acts_as_wiki_page
    has_one :task_category_and_wiki, dependent: :destroy
    has_many :task_category, :through => :task_category_and_wiki
    has_many :wiki_and_workflow_informations, dependent: :destroy
    has_many :homeland_nodes, class_name: "Homeland::Node",  dependent: :destroy
    has_many :task_performances, dependent: :destroy
    has_many :wiki_relationships, dependent: :destroy
    has_many :related_wiki_pages, class_name: "WikiRelationship", foreign_key: "related_wiki_page_id", dependent: :destroy
end
