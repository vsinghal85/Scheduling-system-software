class AddAdminToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :admin, :boolean
  end
end
