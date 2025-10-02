class MenuItemsController < ApplicationController
  before_action :require_login
  before_action :set_menu_item, only: [ :show, :edit, :update, :destroy ]
  # GET /menu_items or /menu_items.json
  def index
    @menu_items = MenuItem.where(active: true)
  end

  # GET /menu_items/1 or /menu_items/1.json
  def show
  end

  # GET /menu_items/new
  def new
    @menu_item = current_restaurant.menu_items.new
    # sets up a new menu item for the current restaurant
    # to fill it by the form
  end

  # GET /menu_items/1/edit
  def edit
  end

  # require login method to check if a restaurant is logged in
  def require_login
    unless current_restaurant
      redirect_to login_path
    end
  end

  # POST /menu_items or /menu_items.json
  def create
    @menu_item = current_restaurant.menu_items.new(menu_item_params)
    # creats a menu item with permitted field inputs

    if @menu_item.save
      redirect_to @menu_item, notice: "Menu item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /menu_items/1 or /menu_items/1.json
  def update
   if @menu_item.update(menu_item_params)
    redirect_to @menu_item, notice: "Menu item was successfully updated.", status: :see_other
   else
    render :edit, status: :unprocessable_entity
   end
  end

  # DELETE /menu_items/1 or /menu_items/1.json
  def destroy
    @menu_item.destroy!
  redirect_to menu_items_path, notice: "Menu item was successfully destroyed.", status: :see_other
  end

  private

    def set_menu_item
      @menu_item = current_restaurant.menu_items.find(params[:id])
    end

    def menu_item_params
      params.expect(menu_item: [ :restaurant_id, :name, :description, :price, :active, :position, :images ])
    end
end
