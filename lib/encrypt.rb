require './test/test_helper'

module Encrypt

  def setup
    @random = Random.new
    # @key = @random.rand(0..99999).to_s.split("")
    @key = "02715"
    @date = "040895"
  end

  def randomkey
    if @key.length < 5
      @key.join.rjust(5, "0")
    else
      @key.join
    end
  end


  def set_keys(key = @key)
    keys_set = Hash.new(0)
    key_set[:a_k] = key[0..1].to_i
    key_set[:b_k] = key[1..2].to_i
    key_set[:c_k] = key[2..3].to_i
    key_set[:d_k] = key[3..4].to_i
    key_set
    binding.pry

  end

  def set_offset(date = @date)
    offset_set = Hash.new(0)
    int_date = date.to_i
    date_squared_last_four = (int_date*int_date).to_s[-4..-1]
    offset_set[:a_o] = date_squared_last_four[0].to_i
    offset_set[:b_o] = date_squared_last_four[1].to_i
    offset_set[:c_o] = date_squared_last_four[2].to_i
    offset_set[:d_o] = date_squared_last_four[3].to_i
    offset_set
  end

  def complete_shift(set_key_hash, set_offset_hash)
    total_shift = Hash.new(0)
    total_shift[:a] = [set_offset_hash[:a_o] + set_key_hash[:a_k]
    total_shift[:b] = set_offset_hash[:b_o] + set_key_hash[:b_k]
    total_shift[:c] = set_offset_hash[:c_o] + set_key_hash[:c_k]
    total_shift[:d] = set_offset_hash[:d_o] + set_key_hash[:d_k]
    total_shift
  end

end
