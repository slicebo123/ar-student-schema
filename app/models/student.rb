require_relative '../../db/config'


class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class AgeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value > 5
      record.errors[attribute] << (options[:message] || "is not an old enough")
    end
  end
end

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.scan(/[0-9]/).size >= 10
      record.errors[attribute] << (options[:message] || "is not a phone number")
    end
  end
end

class Student < ActiveRecord::Base

  belongs_to :teacher
  
  validates :email, uniqueness: true
  validates :email, email: true
  validates :age,   age: true
  validates :phone, phone: true

  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

end
