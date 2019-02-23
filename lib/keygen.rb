require './test/test_helper'

class KeyGen

  def initialize
    @random = Random.new
    @key = @random.rand(0..99999).to_s.split("")
  end

  def randomkey
    if @key.length < 5
      @key.join.rjust(5, "0")
    else
      @key.join
    end
  end
end
