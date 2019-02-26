require './test/test_helper'

class Enigma
  attr_reader :date, :randomkey



  def initialize
    @message = "Hello World"
    @time = Time.new
    @date = @time.strftime("%d%m%y")
    @randomkey = KeyGen.new.randomkey
    @encrypt = Hash.new(0)
    @alphabet = ("a".."z").to_a << " "
  end

  def initial_input(message = @message.downcase, key = @randomkey, date = @date)
      {
      to_be_encrypted: message,
      the_key: key,
      date_to_be_used: date
      }
  end

  

end
