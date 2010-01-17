require 'oauth/signature/base'

if RUBY_VERSION >= "1.9"
  require 'digest/hmac'
else
  require 'hmac-sha2'
end

module OAuth::Signature::HMAC
  class SHA2 < OAuth::Signature::Base
    implements 'hmac-sha2'

    def digest
      if RUBY_VERSION >= "1.9"
        Digest::HMAC.new(secret, Digest::SHA2).digest(signature_base_string)
      else
        ::HMAC::SHA2.digest(secret, signature_base_string)
      end
    end
  end
end
