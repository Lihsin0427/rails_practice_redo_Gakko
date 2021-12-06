class Order < ApplicationRecord
  belongs_to :user
  belongs_to :course
  after_create :serial_generator


  private 
  def serial_generator
    serial = "NFT#{Time.current.strftime("%Y%m%d")}#{code_generator(7)}"
    update(serial: serial)
  end

  def code_generator(n = 7)
    all_chars = [*'A'..'Z', *'0'..'9']
    confused_chars = ['X', 'O', '0', 'B', 'P', 'M', 'N', 'D', 'T']

    (all_chars - confused_chars).sample(n).join
  end
end
