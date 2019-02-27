
module Decryptor

  def complete_backwards_shift(key, offset)
     back_key = []
     back_offset = []

     key.each do |x|
      back_key << (x > 0 ? -x : x)
     end

     offset.each do |x|
     back_offset << (x > 0 ? -x : x)
     end

    [back_key,back_offset].transpose.map{|combination| combination.sum}
  end

  def total_decryption(message, key, date)
    working_keys = set_keys(key)
    working_offsets = set_offset(date)
    total_shift = complete_backwards_shift(working_keys, working_offsets)
    group_together(message).map {|four_letters|
      rotate_by_four(four_letters, total_shift)}.join
  end

end
