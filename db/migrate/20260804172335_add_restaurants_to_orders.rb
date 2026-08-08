class AddRestaurantsToOrders < ActiveRecord::Migration[8.0]
  def change
    add_reference :orders, :restaurant, null: false, foreign_key: true
  end
end
