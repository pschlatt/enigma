require "./test/test_helper"

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_for_instance
    assert_instance_of Enigma, @enigma
  end

  def test_char_set
    skip
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
      "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
      "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.alphabet
  end

  def test_for_current_date
    skip
    expected = "260219"
  assert_equal expected, @enigma.date
  end

  def test_keygen
    skip
    assert_equal 5, @enigma.randomkey.length
  end

  def test_encrypt
    skip
    expected = {
     encryption: "keder ohulw",
     key: "02715",
     date: "040895"
   }
   assert_equal expected, @enigma.encrypt
  end

  def test_set_keys
    assert_equal [2, 27, 71, 15], @enigma.set_keys("02715")
  end

  def test_set_offset
    assert_equal [1, 0, 2, 5], @enigma.set_offset("040895")
  end

  def test_complete_shift
    arg1 = @enigma.set_keys("02715")
    arg2 = @enigma.set_offset("040895")
    assert_equal [3, 27, 73, 20], @enigma.complete_shift(arg1, arg2)
  end

 def test_message
   number = 3
   letter = "h"
   assert_equal "k", @enigma.letter_encryptor(letter, number)
 end

 def test_message_loop_around
   number = 27
   letter = "e"
   assert_equal "e", @enigma.letter_encryptor(letter, number)
 end

 def test_can_it_ignore_special_char
   number = 5
   letter = "!"
   assert_equal "!", @enigma.letter_encryptor(letter, number)
 end


end
