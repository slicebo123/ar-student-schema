class IntData < ActiveRecord::Migration

  def up
    add_column(:students, :name, :string)
    Student.reset_column_information
    Student.all.each {|student| student.name = "#{student.first_name} #{student.last_name}"; student.save}
    remove_column(:students, :first_name)
    remove_column(:students, :last_name)
    add_column(:students, :address, :string)
  end

  def down
    remove_column(:students, :address)
    add_column(:students, :last_name, :string)
    add_column(:students, :first_name, :string)
    Student.reset_column_information
    Student.all.each {|student| student.first_name, student.last_name = student.name.split(" "); student.save}
    remove_column(:students, :name)
  end
end

