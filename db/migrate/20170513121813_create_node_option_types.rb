class CreateNodeOptionTypes < ActiveRecord::Migration
  def change
    create_table :node_option_types do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
