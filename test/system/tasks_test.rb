require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    login_as users(:boss)
    @task = Task.ordered.first
  end

  test "visiting the index" do
    visit tasks_path
  
    assert_selector "h1", text: "Tasks"
    assert_equal "Do the bed", @task.name
  end

  test "Showing a task" do
    visit tasks_url
    
    click_link @task.name
    assert_selector 'h1', text: @task.name
  end
  
  test 'creating a new task' do
    visit tasks_url
    assert_selector 'h1', text: 'Tasks'
    
    click_on 'New task'
    assert_selector 'a', text: 'New task'
    fill_in 'Name', with: 'New task text'

    click_on 'Create task'

    assert_selector 'h1', text: 'Tasks'
    assert_text 'New task text'
  end

  test 'Updating a task' do
    visit tasks_path
    assert_selector 'h1', text: 'Tasks'
    initial_name = @task.name
    
    click_link 'Edit', match: :first
    assert_selector 'h1', text: 'Tasks'
    fill_in "Name", with: "Updated task"

    click_on "Update task"
    assert_selector 'h1', text: 'Tasks'
    assert_text "Updated task"
    assert_no_text initial_name
  end

  test 'destroying a task' do
    visit tasks_path
    assert_text @task.name
    
    click_on "Delete", match: :first
    assert_no_text @task.name
    assert_selector 'h1', text: "Tasks"

  end


end
