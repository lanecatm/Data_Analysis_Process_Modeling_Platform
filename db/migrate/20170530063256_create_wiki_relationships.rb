class CreateWikiRelationships < ActiveRecord::Migration
  def change
    create_table :wiki_relationships do |t|
      t.references :wiki_page, index: true
      t.references :related_wiki_page, index: true

      t.timestamps null: false
    end
    add_foreign_key :wiki_relationships, :wiki_pages
  end
end
