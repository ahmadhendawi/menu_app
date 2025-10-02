class MenuItem < ApplicationRecord
  belongs_to :restaurant
  has_many_attached :images
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :position, presence: true
  validates :active, inclusion: { in: [ true, false ] }
  has_many :order_items, dependent: :destroy
end
