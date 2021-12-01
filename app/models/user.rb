require "digest"

class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, 
  format: { with:/\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/ }
  # ref https://stackoverflow.com/questions/4776907/what-is-the-best-easy-way-to-validate-an-email-address-in-ruby
  
  has_many :courses
  
  has_many :favor_courses
  # 建立關聯
  has_many :favorite_courses, through: :favor_courses, source: :course
  # join table


  before_create :encrypt_password

  def self.login(user_info)
    email = user_info[:email]
    password = user_info[:password]

    salted_password = "xy#{password.reverse}hellohey"
    encryted_password = Digest::SHA1.hexdigest(salted_password)

    self.find_by(email: email, password: encryted_password)
  end
  
  private
  def encrypt_password
    salted_password = "xy#{self.password.reverse}hellohey"
    self.password = Digest::SHA1.hexdigest(salted_password)
  end
end