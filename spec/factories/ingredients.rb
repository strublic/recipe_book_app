FactoryBot.define do
    factory :ingredient do
        name {Faker::Food.ingredient}
        measure {rand(1..20)}
        measure_type {["ml","litro","grama","kg"].sample}
    end
end