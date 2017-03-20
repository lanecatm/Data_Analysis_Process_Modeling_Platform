class CreateWorkflowInformations < ActiveRecord::Migration
  def change
    create_table :workflow_informations do |t|
      t.string :name
      t.text :introduction
      t.text :detial_description
      t.text :version_name
      t.references :category, index: true
      t.references :tag, index: true
      t.references :author, index: true
      t.references :last_editor, index: true
      t.integer :status
      t.datetime :createtime
      t.datetime :valid_from
      t.datetime :valid_to
      t.boolean :persistent
      t.integer :priority
      t.integer :most_possible_duration
      t.integer :minimal_duration
      t.integer :maximal_duration

      t.timestamps null: false
    end
    add_foreign_key :workflow_informations, :categories
    add_foreign_key :workflow_informations, :tags
    add_foreign_key :workflow_informations, :authors
    add_foreign_key :workflow_informations, :last_editors
  end
end
