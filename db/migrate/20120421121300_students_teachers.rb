class StudentsTeachers < ActiveRecord::Migration
  def change
    create_table :student_teachers, :id => false do |t|
      t.integer :teacher_id
      t.integer :student_id
    end
  end
end
