class AddAdminToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :admin, :boolean, default:false
   end
end
