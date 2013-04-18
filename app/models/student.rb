require_relative '../../db/config'

class Student
  attr_reader :birthday
  def assign_attributes(args)
    @id = args[:id]
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @gender = args[:gender]
    @email = args[:email]
    @phone = args[:phone]
    @birthday = args[:birthday]
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def age
    now = Date.today
    age = now.year - @birthday.year - ((now.month > @birthday.month || (now.month == @birthday.month && now.day >= @birthday.day)) ? 0 : 1)
    age
  end

  def self.delete_all
  end
end
