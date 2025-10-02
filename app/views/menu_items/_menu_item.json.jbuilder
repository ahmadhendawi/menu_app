json.extract! menu_item, :id, :restaurant_id, :name, :description, :price, :active, :position, :created_at, :updated_at
json.url menu_item_url(menu_item, format: :json)
