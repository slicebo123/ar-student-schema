require_relative '../../db/config'

class Teacher < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :email, email: true
  validates :phone, phone: true
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.scan(/[0-9]/).size > 10
      record.errors[attribute] << (options[:message] || "is not a phone number")
    end
  end
end

