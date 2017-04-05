class CreateWorkflowInformations < ActiveRecord::Migration
  def change
    create_table :workflow_informations do |t|
      t.string :name
      t.text :introduction
      t.text :detial_description
      t.text :version_name
      t.references :category, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: true
      t.references :last_editor, index: true, foreign_key: true
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
  end
end
