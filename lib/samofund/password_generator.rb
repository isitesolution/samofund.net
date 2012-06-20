module Samofund
  class PasswordGenerator
    def self.generate(size = 10)
      chars = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789"
      password = ""
      size.downto(1) { |i| password << chars[rand(chars.size - 1)] }
      return password
    end
  end
end