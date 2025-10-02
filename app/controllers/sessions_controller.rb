class SessionsController < ApplicationController
  def new
  end

  def create
    restaurant = Restaurant.find_by(email: params[:email].downcase)
    if restaurant&.authenticate(params[:password])
      session[:restaurant_id] = restaurant.id
      redirect_to admin_dashboard_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out"
  end
end
