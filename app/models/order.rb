class Order < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy
  validates :customer_name, presence: true
  validates :phone, presence: true
end
