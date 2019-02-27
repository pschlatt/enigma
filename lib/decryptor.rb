require './test/test_helper'
require './lib/keygen'
require './lib/encryptor'

module Decryptor
  include Encryptor
  include KeyGen

  def total_decryption(message, key, date)
    working_keys = set_keys(key)
    working_offsets = set_offset(date)
    total_shift = complete_backwards_shift(working_keys, working_offsets)
    group_together(message).map {|four_letters|
      rotate_by_four(four_letters, total_shift)}.join
  end

end
