class Restaurant < ApplicationRecord
  has_secure_password
   has_many :menu_items, dependent: :destroy
   validates :name, presence: true
   validates :slug, presence: true, uniqueness: true,
              format: { with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/, message: "only allows lowercase letters, numbers, and hyphens" }
end
