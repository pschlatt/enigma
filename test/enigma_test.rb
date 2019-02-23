require "./test/test_helper"
require "date"

class EnigmaTest < Minitest::Test

def setup
  @enigma = Enigma.new
end

def test_for_instance
  assert_instance_of Enigma, @enigma
end

def test_for_current_date
  date = "230219"
assert_equal date, @enigma.date
end

end
