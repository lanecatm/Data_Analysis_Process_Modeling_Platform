class CreateNullModels < ActiveRecord::Migration
  def change
    create_table :null_models do |t|
      t.string :name
      t.references :ref1, index: true
      t.references :ref2, index: true
      t.references :ref3, index: true

      t.timestamps null: false
    end
    add_foreign_key :null_models, :ref1s
    add_foreign_key :null_models, :ref2s
    add_foreign_key :null_models, :ref3s
  end
end
