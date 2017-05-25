class CreateEdgeAttributes < ActiveRecord::Migration
  def change
    create_table :edge_attributes do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
