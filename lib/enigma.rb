require './test/test_helper'
require './lib/encrypt'

class Enigma

  include Encrypt
  attr_reader :alphabet
def initialize
  @time = Time.new
  @date = @time.strftime("%d%m%y")
  @randomkey = "02715"
  @message = "hello world"
  @alphabet = ("a".."z").to_a << " "
end

  def encrypt(message = @message.downcase, key = @randomkey, date = @date)
      {
      encryption: encrypt_message,
      key: key,
      date: date
      }
  end






end










# class Enigma
# include Encrypt
#
#
#   attr_reader :date,
#               :randomkey,
#               :alphabet
#
#
#
#   def initialize
#     @message = "Hello World"
#     @time = Time.new
#     @date = @time.strftime("%d%m%y")
#     @randomkey = randomkey
#     @alphabet = ("a".."z").to_a << " "
#   end
#
  # def encrypt(message = @message.downcase, key = @randomkey, date = @date)
  #     {
  #     encryption: encrypt_message,
  #     key: key,
  #     date: date
  #     }
  # end
