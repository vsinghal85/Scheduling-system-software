class Mappingmigration < ActiveRecord::Migration[5.0]
  def change
  	add_column :teacher_client_mappings, :teacher_id, :integer
  	add_column :teacher_client_mappings, :client_id, :integer
  end
end
