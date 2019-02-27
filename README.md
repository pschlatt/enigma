# Enigma

- Turing School of Software & Design: build an encryption machine based loosely on the ancient <a href="https://en.wikipedia.org/wiki/Caesar_cipher">Caesar Cipher</a> that can both encrypt and decrypt messages via an algorithm associated with a date and key.
## Algorithm
- [This](http://backend.turing.io/module1/projects/enigma/encryption) is the interaction pattern we were provided to make the encryptor/decryptor.
## Command Line Operation:

### Encryption/Decryption interface
```ruby
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
Created 'decrypted.txt' with the key 82648 and date 240818
```
