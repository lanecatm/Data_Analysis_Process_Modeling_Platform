class AddWikiIndexToHomelandNode < ActiveRecord::Migration
  def change
      add_column :homeland_nodes, :wiki_page_id, :integer, :default => 18
      add_index :homeland_nodes, :wiki_page_id
  end
end
