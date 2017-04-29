class AddTeacherIdToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :teacher_id, :integer
  end
end
