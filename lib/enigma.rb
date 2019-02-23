require './test/test_helper'

class Enigma
  attr_reader :date

  def initialize
    @time = Time.new
    @date = @time.strftime("%d%m%y")
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def encrypt(message, key, date = @date)

  end

end
