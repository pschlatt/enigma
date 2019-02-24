require './test/test_helper'

class Enigma
  attr_reader :date, :randomkey



  def initialize
    @message = "Hello World"
    @time = Time.new
    @date = @time.strftime("%d%m%y")
    @randomkey = KeyGen.new.randomkey
    @encrypt = Hash.new(0)
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def initial_input(message = @message.downcase, key = @randomkey, date = @date)
      {
      to_be_encrypted: message,
      the_key: key,
      date_to_be_used: date
      }
  end

  def encrypt_message
    info_passed = self.initial_input
    key_for_conversion = []
    to_encrypt = info_passed[:to_be_encrypted]
    key = info_passed[:the_key].split("").each_cons(2) {|numbers| key_for_conversion << numbers}
    binding.pry
    date = info_passed[:date_to_be_used]




  end

end
