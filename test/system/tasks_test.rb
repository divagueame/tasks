require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit tasks_url
  
    assert_selector "h1", text: "Tasks"
    assert_equal "Do the bed", tasks(:first).name
  end
end
