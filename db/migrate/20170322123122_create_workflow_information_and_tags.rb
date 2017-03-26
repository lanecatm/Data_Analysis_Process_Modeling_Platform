class CreateWorkflowInformationAndTags < ActiveRecord::Migration
  def change
    create_table :workflow_information_and_tags do |t|
      t.references :workflow_information, index: true
      t.references :workflow_tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :workflow_information_and_tags, :workflow_informations
    add_foreign_key :workflow_information_and_tags, :workflow_tags
  end
end
