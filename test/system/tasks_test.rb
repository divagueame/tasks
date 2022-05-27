require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:first)
  end

  test "visiting the index" do
    visit tasks_url
  
    assert_selector "h1", text: "Tasks"
    assert_equal "Do the bed", tasks(:first).name
  end

  test "Showing a task" do
    visit tasks_url
    
    click_link @task.name
    assert_selector 'h1', text: @task.name
  end
  
  test 'Updating a task' do
    visit tasks_url
    # click_link @task.name
    click_link 'Edit', match: :first
    assert_selector 'h1', text: 'Edit task'


    fill_in "Name", with: "Updated task"
    click_on "Update task"

    assert_selector 'h1', text: 'Tasks'
  end

end
