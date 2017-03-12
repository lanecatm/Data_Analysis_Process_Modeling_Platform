class CreateProcessInformations < ActiveRecord::Migration
  def change
    create_table :process_informations do |t|
      t.string :name
      t.text :introduction
      t.references :author, index: true
      t.references :last_editor, index: true
      t.datetime :createtime
      t.datetime :edittime
      t.string :version
      t.references :version_parent, index: true
      t.references :category, index: true
      t.text :functional_description
      t.references :separator, index: true

      t.timestamps null: false
    end
    add_foreign_key :process_informations, :authors
    add_foreign_key :process_informations, :last_editors
    add_foreign_key :process_informations, :version_parents
    add_foreign_key :process_informations, :categories
    add_foreign_key :process_informations, :separators
  end
end
