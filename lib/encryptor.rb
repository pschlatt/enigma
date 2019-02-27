
module Encryptor


  def complete_forwards_shift(key, offset)
    [key,offset].transpose.map{|combination| combination.sum}
  end


    def letter_encryptor(letter, number)
      if @alphabet.include?(letter)
        index = @alphabet.find_index(letter)
        shifted_char = @alphabet.rotate(number)
        shifted_char[index]
      else
        letter
      end
    end

    def rotate_by_four(letters, numbers)
      letters.map.with_index {|letter, index|
        letter_encryptor(letter, numbers[index])}
    end

    def group_together(message)
      message.split(//).each_slice(4).to_a
    end

    def total_encryption(message, key, date)
        working_keys = set_keys(key)
        working_offsets = set_offset(date)
        total_shift = complete_forwards_shift(working_keys, working_offsets)
        group_together(message).map {|four_letters|
          rotate_by_four(four_letters, total_shift)}.join
    end




end
