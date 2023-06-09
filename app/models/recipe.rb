class Recipe < ApplicationRecord
    has_many :ingredients, inverse_of: :recipe, dependent: :destroy
    has_many :method_steps, inverse_of: :recipe, dependent: :destroy

    accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :method_steps, reject_if: :all_blank, allow_destroy: true

    validates :name, length: { maximum: 100 }, presence: true
    validates :body, length: 1..1000, presence: true
end
