module DataEncrption
  module ApplicationEncrptionHelper
    def encrypt_data(data:)
      len = ActiveSupport::MessageEncryptor.key_len
      salt  = SecureRandom.random_bytes(len)
      key   = ActiveSupport::KeyGenerator.new(SecureRandom.alphanumeric).generate_key(salt, len)
      crypt = ActiveSupport::MessageEncryptor.new(key)
      crypt.encrypt_and_sign(data)
    end

    def decrypt_data(encrypted_data:)
      len = ActiveSupport::MessageEncryptor.key_len
      salt  = SecureRandom.random_bytes(len)
      key   = ActiveSupport::KeyGenerator.new(SecureRandom.alphanumeric).generate_key(salt, len)
      crypt = ActiveSupport::MessageEncryptor.new(key)
      crypt.decrypt_and_verify(encrypted_data)
    end

    def initialize
      len = ActiveSupport::MessageEncryptor.key_len
      salt  = SecureRandom.random_bytes(len)
      key   = ActiveSupport::KeyGenerator.new(SecureRandom.alphanumeric).generate_key(salt, len)
      crypt = ActiveSupport::MessageEncryptor.new(key)
    end

    def reset
      len = ActiveSupport::MessageEncryptor.key_len
      salt  = SecureRandom.random_bytes(len)
      key   = ActiveSupport::KeyGenerator.new(SecureRandom.alphanumeric).generate_key(salt, len)
      crypt = ActiveSupport::MessageEncryptor.new(key)
    end
  end

  module OpenSSLApplicationEncrptionHelper
    def encrypt_data(data:)
      data
    end

    def decrypt_data(encrypted_data:)
      encrypted_data
    end

    def encrypt_data_bck(data:)
      cipher = OpenSSL::Cipher.new('aes-256-cbc')
      cipher.encrypt
      cipher.update(data.to_s) + cipher.final
    end

    def decrypt_data_bck(encrypted_data:)
      decipher = OpenSSL::Cipher.new('aes-256-cbc')
      decipher.decrypt
      decipher.update(encrypted_data) + decipher.final
    end
  end
end

