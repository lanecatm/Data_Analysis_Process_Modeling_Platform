class AddXmlToWorkflowInformation < ActiveRecord::Migration
  def change
      add_column :workflow_informations, :xml, :text
  end
end
