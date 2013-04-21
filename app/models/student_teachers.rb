require_relative '../../db/config'

class StudentTeacher < ActiveRecord::Base
end

500.times do |n|
  StudentTeacher.create(teacher_id: rand(1..8), student_id: rand(1..54))
end
