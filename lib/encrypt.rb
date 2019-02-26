require './test/test_helper'

class Encrypt

  def initialize(input)
    @input = input
  end

  def encrypt_message
    info_passed = @input
    key_for_conversion = []

    to_encrypt = info_passed[:to_be_encrypted]
    key = info_passed[:the_key].split("").each_cons(2) {|numbers| key_for_conversion << numbers}
    interfaced_key = key_for_conversion
    binding.pry
    date = info_passed[:date_to_be_used]




  end

end
