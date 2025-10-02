class Admin::DashboardController < ApplicationController
  def index
    # to show the current restaurants menu items and active/inactive counts
    @menu_items= current_restaurant.menu_items.order(:position)
    @active_count = @menu_items.where(active: true).count
    @inactive_count = @menu_items.where(active: false).count
    # a search bar for the admin to search for menu items by name
    # im using postgresql in this case i must use ILIKE for case insensitive search
    if params[:search].present?
      @menu_items = @menu_items.where("name ILIKE ?", "%#{params[:search]}%")
    end
  end
end
