require 'oauth/signature/base'

if RUBY_VERSION >= "1.9"
  require 'digest/hmac'
else
  require "rubygems"
  require 'hmac-sha1'
end

module OAuth::Signature::HMAC
  class SHA1 < ::OAuth::Signature::Base
    implements 'hmac-sha1'

    def digest
      if RUBY_VERSION >= "1.9"
        Digest::HMAC.new(secret, Digest::SHA1).digest(signature_base_string)
      else
        ::HMAC::SHA1.digest(secret, signature_base_string)
      end
    end
  end
end
