class Order < ApplicationRecord
  belongs_to :user
  belongs_to :course
  after_create :serial_generator


  private 
  def serial_generator
    serial = "NFT#{Time.current.strftime("%Y%m%d")}#{id.to_s.rjust(7, '0')}"
    update(serial: serial)
  end
end
