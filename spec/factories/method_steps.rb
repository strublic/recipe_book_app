FactoryBot.define do
    factory :method_step do
        step {Faker::Lorem.word}
    end
end