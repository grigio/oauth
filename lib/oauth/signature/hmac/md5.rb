require 'oauth/signature/base'

if RUBY_VERSION >= "1.9"
  require 'digest/hmac'
else
  require 'hmac-md5'
end

module OAuth::Signature::HMAC
  class MD5 < OAuth::Signature::Base
    implements 'hmac-md5'

    def digest
      if RUBY_VERSION >= "1.9"
        Digest::HMAC.new(secret, Digest::MD5).digest(signature_base_string)
      else
        ::HMAC::MD5.digest(secret, signature_base_string)
      end
    end
  end
end
