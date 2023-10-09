require "test_helper"

class GoodDealsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get good_deals_index_url
    assert_response :success
  end
end
