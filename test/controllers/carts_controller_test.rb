require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cart_url

    assert_response :success
  end

  test "should add item" do
    post add_to_cart_url(menu_items(:one))

    assert_redirected_to root_url
  end

  test "should remove item" do
    delete remove_from_cart_url(menu_items(:one))

    assert_redirected_to cart_url
  end
end
