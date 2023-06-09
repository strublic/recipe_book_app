class MethodStep < ApplicationRecord
  belongs_to :recipe

  validates :step, presence: true
end
