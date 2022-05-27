require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:first)
  end

  test "visiting the index" do
    visit tasks_path
  
    assert_selector "h1", text: "Tasks"
    assert_equal "Do the bed", tasks(:first).name
  end

  test "Showing a task" do
    visit tasks_url
    
    click_link @task.name
    assert_selector 'h1', text: @task.name
  end
  
  test 'Updating a task' do
    visit tasks_path
    
    click_link 'Edit', match: :first
    assert_selector 'h1', text: 'Edit task'


    fill_in "Name", with: "Updated task"
    click_on "Update task"

    assert_selector 'h1', text: 'Tasks'
  end

  test 'destroying a task' do
    visit tasks_path
    assert_text @task.name
    click_on "Delete", match: :first
    assert_selector 'h1', text: "Tasks"
    assert_no_text @task.name

  end


end
