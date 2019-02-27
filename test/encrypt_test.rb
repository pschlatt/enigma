require './test/test_helper'

class EncryptTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_key_set
    key = "02715"
   expected = { :a => 02,
                :b => 27,
                :c => 71,
                :d => 15 }
    assert_equal expected, @enigma.key_set(key)
  end

end
