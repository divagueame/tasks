require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    login_as users(:boss)
    @task = tasks(:one)
    @todo = todos(:one)

    visit task_path(@task)
  end

  test "creating a new todo" do
    assert_no_text 'A new name'
    assert_selector "h1", text: @task.name
    click_on 'New todo'
    fill_in 'todo_name', with: 'A new name'
    click_on 'Create to-do'
    assert_selector "h2.todo__title", text: 'A new name'
  end

  test 'Updating a todo' do
    assert_selector 'h1', text: @task.name
    initial_name = @todo.name
    
    within id: dom_id(@todo) do
      click_on "Edit"
    end
    assert_selector 'h1', text: @task.name
    fill_in 'todo_name', with: 'An updated name'

    click_on "Update to-do"
    assert_selector 'h1', text: @task.name
    assert_text 'An updated name'
    assert_no_text initial_name
  end

  test 'destroying a todo' do
    
    assert_text @todo.name
    accept_confirm do
      within id: dom_id(@todo) do
        click_on "Delete"
      end
    end

    assert_no_text @todo.name
    assert_selector 'h1', text: @task.name
  end


end
