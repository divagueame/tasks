require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test "#previous_todo returns the task's previous todo if it exists" do
    assert_equal todos(:one), todos(:two).previous_todo
  end
  
  test "#previous_todo returns nil if there is no task's previous todo" do
    assert_nil todos(:one).previous_todo
  end
end
