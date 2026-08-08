require "test_helper"

class Public::MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    restaurant = restaurants(:one)

    get menu_url(restaurant.slug)

    assert_response :success
  end
end
