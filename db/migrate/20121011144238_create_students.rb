require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |field|
      field.integer :id
      field.string  :first_name
      field.string  :last_name  
      field.string  :gender
      field.string  :email
      field.string  :phone
      field.date    :birthday
    end
  end
end
