class WikiRelationship < ActiveRecord::Base
  belongs_to :wiki_page
  belongs_to :related_wiki_page, class_name: "WikiPage"
end
