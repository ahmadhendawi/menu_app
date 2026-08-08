class OrdersController < ApplicationController
  before_action :set_order, only: [ :show ]
  before_action :ensure_cart_has_items, only: [ :create, :new ]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.status = "pending"
    @order.restaurant_id = session[:cart_restaurant_id]

    begin
      Order.transaction do
        @order.save!

        MenuItem.find(session[:cart].keys).each do |item|
          quantity = session[:cart][item.id.to_s] || 1
          @order.order_items.create!(menu_item: item, quantity: quantity)
        end
      end

      session[:cart] = {}
      session.delete(:cart_restaurant_id)
      redirect_to @order
    rescue ActiveRecord::RecordInvalid => error
      if error.record != @order
        @order.errors.add(:base, error.record.errors.full_messages.to_sentence)
      end

      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_name, :phone)
  end

  def ensure_cart_has_items
    if session[:cart].blank?
      session.delete(:cart_restaurant_id)
      redirect_to root_path, alert: "Your cart is empty. Please add items to your cart before placing an order."
    end
  end
end
