require './test/test_helper'
require './lib/keygen'

module Encryptor

include KeyGen

  def setup
    # @random = Random.new
    # @key = @random.rand(0..99999).to_s.split("")
    # @key = "02715"
    @date = "040895"
    @alphabet = ("a".."z").to_a << " "
  end




  def set_keys(key = randomkey)
    key = key.split(//).each_cons(2).to_a
    join_keys = key.map {|var| var.join}
    join_keys.map { |string| string.to_i }
  end

  def set_offset(date = @date)
    date_squared = date.to_i ** 2
    offset = date_squared.to_s.split(//).to_a.last(4)
    offset.map {|string| string.to_i}
  end

  def complete_forwards_shift(key, offset)
    [key,offset].transpose.map{|combination| combination.sum}
  end

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
