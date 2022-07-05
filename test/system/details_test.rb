require 'application_system_test_case'

class DetailsTest < ApplicationSystemTestCase
  include ActionView::Helpers::NumberHelper

  setup do
    login_as users(:boss)

    @task = tasks(:one)
    @todo = todos(:one)
    @detail = details(:go_bathroom)

    visit task_path(@task)
    assert_text @task.total_time
  end

  test 'Creating a new line item' do
    assert_selector 'h1', text: 'Do the bed'

    within "##{dom_id(@todo)}" do
      click_on 'Add detail', match: :first
    end
    assert_selector 'h1', text: 'Do the bed'

    within "##{dom_id(@todo)}" do
      find_field('detail_name').set('This is a new name')
      fill_in 'Description', with: 'A new beautiful description'

      find('#detail_time option:last-of-type').select_option
      p
      click_on 'Create detail'
    end
    assert_selector 'h1', text: 'Do the bed'
    assert_text 'A new beautiful description'
    assert_text 'This is a new name'
    assert_text '300'
  end

  test 'Updating a detail' do
    assert_selector 'h1', text: 'Do the bed'
    assert_text 'Need to go to the bathroom with your feet'

    within "##{dom_id(@detail)}" do
      assert_selector '.detail__name', text: 'Go to bathroom'
      click_on 'Edit', match: :first
    end
    assert_selector 'h1', text: 'Do the bed'

    fill_in 'Description', with: 'new description'
    click_on 'Update detail'

    assert_text 'new description'
    assert_no_text 'Need to go to the bathroom with your feet'
    assert_selector 'h1', text: 'Do the bed'
  end

  test 'destroying a detail' do
    assert_selector 'h1', text: 'Do the bed'
    assert_text 'Need to go to the bathroom with your feet'

    assert_text 'Go to bathroom'
    within "##{dom_id(@detail)}" do
      click_on 'Delete', match: :first
    end
    assert_no_text 'Go to bathroom'
    assert_selector 'h1', text: 'Do the bed'
  end
end
