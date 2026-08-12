class CartsController < ApplicationController
   def show
    session[:cart] ||= {}
    @cart_items = MenuItem.find(session[:cart].keys)
     # make sure there is a cart if not then create one
     # takes the key of the hashes and finds that menu item in the DB
     # stores them into @cart_items
   end

  def add
    @menu_item = MenuItem.find(params[:menu_item_id])
   session[:cart] ||= {}
   if session[:cart_restaurant_id] && session[:cart_restaurant_id] != @menu_item.restaurant_id
    redirect_back(fallback_location: root_path, alert: "You can only add items from the same restaurant to your cart")
    return
   end
   session[:cart_restaurant_id] = @menu_item.restaurant_id
    id = params[:menu_item_id].to_s
    session[:cart][id] =  1
    redirect_back fallback_location: root_path, notice: "Item added to cart"
    # reads menu item id from add button then converts it to a string
    # adds it to the cart setting quanitity to 1
  end

  def remove
    session[:cart] ||= {}
    session[:cart].delete(params[:menu_item_id].to_s)
    if session[:cart].empty?
      session.delete(:cart_restaurant_id)
    end
    redirect_to cart_path
  end
end
