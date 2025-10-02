class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :phone
      t.string :status

      t.timestamps
    end
  end
end
