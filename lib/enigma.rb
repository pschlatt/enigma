require './test/test_helper'
require './lib/encryptor'
require './lib/keygen'

class Enigma

  include Encryptor
  include KeyGen

  attr_reader :alphabet,
              :date
def initialize
  @time = Time.new
  @date = @time.strftime("%d%m%y")
  @date_test = "040895"
  @message = "hello world"
  @alphabet = ("a".."z").to_a << " "
  @key = randomkey
end

  def encrypt(message = @message.downcase, key = @key, date = @date)
      {
      encryption: total_encryption(message, key, date),
      key: key,
      date: date
      }
  end

  def decrypt(ciphertext = @message.downcase, key = @key, date = @date)
  {
    decryption: total_decryption(ciphertext, key, date),
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
