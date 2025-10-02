class OrdersController < ApplicationController
  before_action :set_order, only: [ :show ]
  def new
    @order = Order.new
  end
  def create
      @order = Order.new(order_params)
  @order.status = "pending"

  if @order.save
    # if order is saved then create order items from cart
    session[:cart] ||= {}
    cart_items = MenuItem.find(session[:cart].keys)
    cart_items.each do |item|
      # find cart items stored in session[:cart] by ID
      quantity = session[:cart][item.id.to_s] || 1
      @order.order_items.create(menu_item: item, quantity: quantity)
      # create orderItem items with menu_item and quantity and this is
      # basically how order knows what items are in cart
    end
    session[:cart] = {}
    redirect_to @order
  else
    render :new
  end
  end
  def show
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_name, :phone)
  end
end
