class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

def create
  @restaurant = Restaurant.new(restaurant_params)
  if @restaurant.save
    session[:restaurant_id] = @restaurant.id
    redirect_to admin_dashboard_path, notice: "Account created"
  else
    render :new
  end
end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :slug, :email, :password, :password_confirmation)
  end
end
