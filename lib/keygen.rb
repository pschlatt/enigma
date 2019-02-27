module KeyGen

  def randomkey
    rand(0..99999).to_s.rjust(5, "0")
  end

end
