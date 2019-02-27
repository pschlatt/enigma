require './test/test_helper'

















module Encrypt
  

  def setup
    @random = Random.new
    # @key = @random.rand(0..99999).to_s.split("")
    @key = "02715"
    @date = "040895"
    @alphabet = ("a".."z").to_a << " "
  end
#
  def randomkey
    if @key.length < 5
      @key.join.rjust(5, "0")
    else
      @key.join
    end
  end
#
#
  def set_keys(key = @key)
    key = key.split(//).each_cons(2).to_a
    join_keys = key.map {|var| var.join}
    join_keys.map { |string| string.to_i }
  end

  def set_offset(date = @date)
    date_squared = date.to_i ** 2
    offset = date_squared.to_s.split(//).to_a.last(4)
    offset.map {|string| string.to_i}
  end

  def complete_shift(key, offset)
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


  # def encrypt_message(message = "hello world", key = set_keys, date = set_offset)
  #   split_message = message.downcase.split(//)
  #   encrypted_message = []
  #   total_shift = complete_shift(set_key_hash, set_offset_hash)
  #   split_message.each_with_index do |letter, index|
  #       if index % 4 == 0
  #     encrypted_message << encrypt_letter(letter, total_shift[:a])
  #   elsif index % 4 == 1
  #     encrypted_message << encrypt_letter(letter, total_shift[:b])
  #   elsif index % 4 == 2
  #     encrypted_message << encrypt_letter(letter, total_shift[:c])
  #   elsif index % 4 == 3
  #     encrypted_message << encrypt_letter(letter, total_shift[:d])
  #     end
  #   end
  #   encrypted_message.join
  # end
#
end
