class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, depdent: :destroy
  has_many :foods
end
