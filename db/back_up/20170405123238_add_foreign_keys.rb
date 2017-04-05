class AddForeignKeys < ActiveRecord::Migration
  def change
    #add_foreign_key :workflow_informations, :categories
    #add_foreign_key :workflow_informations, :tags
    #add_foreign_key :workflow_informations, :authors
    #add_foreign_key :workflow_informations, :last_editors
    add_reference :workflow_informations, :category, index: true, foreign_key: true
    add_reference :workflow_informations, :tag, index: true, foreign_key: true
    add_reference :workflow_informations, :author, index: true, foreign_key: true
    add_reference :workflow_informations, :last_editor, index: true, foreign_key: true
  end
end
