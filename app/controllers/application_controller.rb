class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_restaurant

def current_restaurant
    @current_restaurant ||= Restaurant.find(session[:restaurant_id]) if session[:restaurant_id]
  end

  def require_login
    redirect_to login_path unless current_restaurant
  end
end
