require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test '#total_time returns the sum of the related details time values' do
    assert_equal 11, tasks(:one).total_time
  end
end
