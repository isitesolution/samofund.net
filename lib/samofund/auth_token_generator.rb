module Samofund
  class AuthTokenGenerator
    def self.generate(email)
      Digest::SHA1.hexdigest(email + rand(44533).to_s)
    end
  end
end