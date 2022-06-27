require 'application_system_test_case'

class DetailsTest < ApplicationSystemTestCase
  include ActionView::Helpers::NumberHelper

  setup do
    login_as users(:boss)
    @task = tasks(:one)
    @todo = todos(:one)
    @detail = details(:go_bathroom)

    visit task_path(@task)
  end


    test "Creating a new line item" do
    assert_selector "h1", text: "Do the bed"

    within "##{dom_id(@todo)}" do
      click_on "Add detail", match: :first
    end
    assert_selector "h1", text: "Do the bed"
 
    find_field("detail_name").set("Beaa")
    fill_in "Description", with: "Animation2"
    fill_in "Time", with: 1234
    click_on "Create detail"

    assert_selector "h1", text: "Do the bed"
    assert_text "Animation2"
    assert_text "Beaa"
    assert_text "1234"
  end

  test 'Updating a detail' do
    assert_selector "h1", text: "Do the bed"
    assert_text "Need to go to the bathroom with your feet"

    within "##{dom_id(@detail)}" do
      assert_selector ".detail__name", text: "Go to bathroom"
      click_on "Edit", match: :first
    end
    assert_selector "h1", text: "Do the bed"

    fill_in "Description", with: "new description"
    click_on "Update detail"

    assert_text "new description"
    assert_no_text "Need to go to the bathroom with your feet"
    assert_selector "h1", text: "Do the bed"
  end

  test 'destroying a detail' do
    assert_selector "h1", text: "Do the bed"
    assert_text "Need to go to the bathroom with your feet"

    assert_text "Go to bathroom"
    within "##{dom_id(@detail)}" do
      click_on "Delete", match: :first
    end
    assert_no_text "Go to bathroom"
    assert_selector "h1", text: "Do the bed"
  end
end
