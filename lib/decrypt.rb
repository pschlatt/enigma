require './lib/enigma'

enigma_out = Enigma.new

reader  = ARGV[0]
writer = ARGV[1]
reader = File.open(reader, "r")

message_to_be_decrypted = reader.read.chomp

key = ARGV[2]
date = ARGV[3]
decrypted = enigma_out.decrypt(message_to_be_decrypted, key, date)
writer = File.open(writer, "w")
writer.write(decrypted[:decryption])
reader.close
writer.close

p "Created #{writer} with the key: #{decrypted[:key]} and date: #{decrypted[:date]}."
