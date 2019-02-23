require './test/test_helper'

class Enigma
  attr_reader :date, :randomkey



  def initialize
    @time = Time.new
    @date = @time.strftime("%d%m%y")
    @randomkey = KeyGen.new.randomkey

  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def encrypt(message, key = @randomkey, date = @date)
    {
      to_be_encrypted: message,
      the_key: key,
      date_to_be_used: date
    }
  end

end
