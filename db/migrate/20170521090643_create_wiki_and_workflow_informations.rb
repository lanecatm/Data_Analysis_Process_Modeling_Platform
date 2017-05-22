class CreateWikiAndWorkflowInformations < ActiveRecord::Migration
  def change
    create_table :wiki_and_workflow_informations do |t|
      t.references :wiki_page, index: true
      t.references :workflow_information, index: true

      t.timestamps null: false
    end
    add_foreign_key :wiki_and_workflow_informations, :wiki_pages
    add_foreign_key :wiki_and_workflow_informations, :workflow_informations
  end
end
