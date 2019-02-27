
module Shifter

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

end
