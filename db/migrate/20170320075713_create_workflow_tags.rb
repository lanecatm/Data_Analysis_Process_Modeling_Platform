class CreateWorkflowTags < ActiveRecord::Migration
  def change
    create_table :workflow_tags do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
