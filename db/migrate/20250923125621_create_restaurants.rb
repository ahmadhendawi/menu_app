class CreateRestaurants < ActiveRecord::Migration[8.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :slug
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
