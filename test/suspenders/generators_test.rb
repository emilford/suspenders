require "test_helper"

class Suspenders::GeneratorsTest < ActiveSupport::TestCase
  class APIAppUnsupportedTest < Suspenders::GeneratorsTest
    test "message returns a custom message" do
      expected = "This generator cannot be used on API only applications."

      assert_equal expected, Suspenders::Generators::APIAppUnsupported::Error.new.message
    end
  end
end