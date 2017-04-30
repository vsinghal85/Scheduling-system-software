class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :teacher_client_mappings, class_name: 'TeacherClientMapping'
   has_many :teacher_client_mappings
   has_many :clients,through: :teacher_client_mappings
      
end
