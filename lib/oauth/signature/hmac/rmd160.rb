require 'oauth/signature/base'

if RUBY_VERSION >= "1.9"
  require 'digest/hmac'
else
  require 'hmac-rmd160'
end

module OAuth::Signature::HMAC
  class RMD160 < OAuth::Signature::Base
    implements 'hmac-rmd160'

    def digest
      if RUBY_VERSION >= "1.9"
        Digest::HMAC.new(secret, Digest::RMD160).digest(signature_base_string)
      else
        ::HMAC::RMD160.digest(secret, signature_base_string)
      end
    end
  end
end
