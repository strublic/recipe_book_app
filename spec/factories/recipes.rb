FactoryBot.define do
    factory :recipe do
        name { Faker::Food.dish }
        body { Faker::Food.description }
        ingredient
        method_step
    end
end
  