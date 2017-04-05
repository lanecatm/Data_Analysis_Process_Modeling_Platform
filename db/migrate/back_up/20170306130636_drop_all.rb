class DropAll < ActiveRecord::Migration
  def change
      drop_table :process_informations 
      drop_table :comments
      drop_table :authors
      drop_table :departments
      #drop_table :categorys
      drop_table :tags
      drop_table :algorithms
      drop_table :types
      drop_table :formats
      drop_table :column_informations
      drop_table :separators
  end
end
