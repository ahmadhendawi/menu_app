require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    post add_to_cart_url(menu_items(:one))
    get new_order_url

    assert_response :success
  end

  test "should create order" do
    post add_to_cart_url(menu_items(:one))

    assert_difference("Order.count", 1) do
      post orders_url, params: {
        order: { customer_name: "Ahmad", phone: "123456789" }
      }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should get show" do
    get order_url(orders(:one))

    assert_response :success
  end
end
