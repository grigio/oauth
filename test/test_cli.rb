require File.dirname(__FILE__) + '/test_helper.rb'

class TestCLI < Test::Unit::TestCase

  def setup
  end
  
  def test_oauth_command
    assert_equal "OAuth for Ruby #{OAuth::VERSION}\n", `ruby bin/oauth version`
  end
end
