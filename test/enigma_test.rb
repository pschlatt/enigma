require "./test/test_helper"

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @time = Time.new
    @date = @time.strftime("%d%m%y")
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
    assert_equal [3, 27, 73, 20], @enigma.complete_forwards_shift(arg1, arg2)
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

 def test_can_rotate_by_four
   numbers = [3, 27, 73, 20]
   letters = ['h', 'e', 'l', 'l']
   expected = ['k', 'e', 'd', 'e']
   assert_equal expected, @enigma.rotate_by_four(letters, numbers)
   letters_with_special_char = ['h', 'e', 'l', '!']
   expected_2 = ['k', 'e', 'd', '!']
   assert_equal expected_2, @enigma.rotate_by_four(letters_with_special_char, numbers)
   letters_with_space = ['h', ' ', 'l', 'l']
   expected_3 = ['k', ' ', 'd', 'e']
   assert_equal expected_3, @enigma.rotate_by_four(letters_with_space, numbers)
 end

 def test_can_group_by_four_characters
   expected = [['h', 'e', 'l', 'l'], ['o', ' ', 'w', 'o'], [ 'r', 'l', 'd', '!']]
   message = "hello world!"
   assert_equal expected, @enigma.group_together(message)
 end

 def test_full_statement_encryption
   message = "hello world"
   expected = "keder ohulw"
   key = "02715"
   date = "040895"
   assert_equal expected, @enigma.total_encryption(message, key, date)
 end

 def test_encrypt
   expected = {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
  }
  assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
 end

  def test_decrypt
   expected = {
     decryption: "hello world",
     key: "02715",
     date: "040895"
   }
   assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encrypt_todays_date
    expected = {
     encryption: "qnhaxisd u ",
     key: "02715",
     date: @date
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715", @date)
  end

  def test_decrypt_todays_date
    expected = {
     decryption: "hello world",
     key: "02715",
     date: @date
    }
    assert_equal expected, @enigma.decrypt("qnhaxisd u ", "02715", @date)
  end



end
