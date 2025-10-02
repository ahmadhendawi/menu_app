class CartsController < ApplicationController
   def show
    session[:cart] ||= {}
    @cart_items = MenuItem.find(session[:cart].keys)
     # make sure there is a cart if not then create one
     # takes the key of the hashes and finds that menu item in the DB
     # stores them into @cart_items
   end

  def add
   session[:cart] ||= {}
    id = params[:menu_item_id].to_s
    session[:cart][id] =  1
    redirect_back fallback_location: root_path
    # reads menu item id from add button then converts it to a string
    # adds it to the cart setting quanitity to 1
  end

  def remove
    session[:cart] ||= {}
    session[:cart].delete(params[:menu_item_id].to_s)
    redirect_to cart_path
  end
end
