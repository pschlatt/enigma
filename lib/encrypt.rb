require './lib/enigma'

enigma_in = Enigma.new
key = "82648"
date = "240818"


reader = ARGV[0]
writer = ARGV[1]

writer = File.open(writer, "w")
reader = File.open(reader, "r")
message_to_be_encrypted = reader.read.chomp.downcase
reader.close

encrypted = enigma_in.encrypt(message_to_be_encrypted, key, date)
writer.write(encrypted[:encryption])
writer.close

p "Created '#{writer}' with the key: #{encrypted[:key]} and date: #{encrypted[:date]}."
