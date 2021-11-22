require "digest"

class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, 
  format: { with:/\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/ }
  # ref https://stackoverflow.com/questions/4776907/what-is-the-best-easy-way-to-validate-an-email-address-in-ruby
  
  before_save :encrypt_password

  private
  def encrypt_password
    salted_password = "xy#{self.password.reverse}hellohey"
    self.password = Digest::SHA1.hexdigest(salted_password)
  end
end