require 'test_helper'

class ToggleDoneControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Rails >= 5
  setup do
    sign_in users(:boss)
    @task = tasks(:one)
    @todo = todos(:one)
    @todo_undone = todos(:two)
  end

  test 'Undone task must set done to true if the checkbox is clicked' do
    get task_path(@task)
    assert_response :success
    assert_select 'h1', @task.name
    assert_select 'h2', @todo.name
    assert_select '.todo', 3
    assert_select '.todo.todo-done', 2

    assert_equal 2, @task.todos.where(done: true).count

    patch task_todo_toggle_done_todo_path(@task, @todo),
          params: {
            todo: {
              id: @todo.id,
              done: true,
              task_id: @task.id
            }
          }

    assert_equal 3, @task.todos.where(done: true).count
  end

  test 'Done tasks should reset if the togglecheckbox is clicked' do
    get task_path(@task)
    assert_response :success
    assert_select 'h1', @task.name
    assert_select 'h2', @todo_undone.name
    assert_select '.todo', 3
    assert_select '.todo.todo-done', 2

    assert_equal 2, @task.todos.where(done: true).count

    patch task_todo_toggle_done_todo_path(@task, @todo_undone),
          params: {
            todo: {
              id: @todo_undone.id,
              done: false,
              task_id: @todo_undone.id
            }
          }

    assert_equal 1, @task.todos.where(done: true).count
  end
end
