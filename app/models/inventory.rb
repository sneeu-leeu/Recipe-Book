class Inventory < ApplicationRecord
  # validates :name, :description, presence:true
  belongs_to :user
  has_many :inventory_foods
end