class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :name, presence: true
  validates :measure, presence: true
  validates :measure_type, presence: true
end
