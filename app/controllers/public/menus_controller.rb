class Public::MenusController < ApplicationController
  def show
    @restaurant = Restaurant.find_by(slug: params[:slug])
    @menu_items = @restaurant.menu_items.where(active: true).order(:position)
  end
end
