require "./test/test_helper"

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_for_instance
    assert_instance_of Enigma, @enigma
  end

  def test_char_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
      "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
      "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.alphabet
  end

  def test_for_current_date
    expected = "260219"
  assert_equal expected, @enigma.date
  end

  def test_keygen
    skip
    assert_equal 5, @enigma.randomkey.length
  end



end
