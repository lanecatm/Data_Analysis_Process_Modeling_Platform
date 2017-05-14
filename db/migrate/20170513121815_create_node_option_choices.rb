class CreateNodeOptionChoices < ActiveRecord::Migration
  def change
    create_table :node_option_choices do |t|
      t.references :node_option, index: true
      t.text :name
      t.text :value

      t.timestamps null: false
    end
    add_foreign_key :node_option_choices, :node_options
  end
end
