class CreateNodeOptionValues < ActiveRecord::Migration
  def change
    create_table :node_option_values do |t|
      t.references :node_option, index: true
      t.references :workflow_information, index: true
      t.string :value
      t.references :node_attribute, index: true

      t.timestamps null: false
    end
    add_foreign_key :node_option_values, :node_options
    add_foreign_key :node_option_values, :workflow_informations
    add_foreign_key :node_option_values, :node_attributes
  end
end
