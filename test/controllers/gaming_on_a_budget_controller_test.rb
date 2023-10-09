require "test_helper"

class GamingOnABudgetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gaming_on_a_budget_index_url
    assert_response :success
  end
end
