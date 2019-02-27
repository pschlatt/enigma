module Aggregator

  def rotate_by_four(letters, numbers)
    letters.map.with_index {|letter, index|
      letter_encryptor(letter, numbers[index])}
  end

  def group_together(message)
    message.split(//).each_slice(4).to_a
  end

end
