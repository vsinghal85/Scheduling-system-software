class CreateTeacherClientMappings < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_client_mappings do |t|

      t.timestamps
    end
  end
end
