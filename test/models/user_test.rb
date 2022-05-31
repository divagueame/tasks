require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "name method returns name from email" do
    assert_equal 'Boss', users(:boss).name
  end
end
