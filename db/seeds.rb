# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Seeding...'

puts 'Creating 10 Recipes ...'

10.times do
    Recipe.create!(
        name: Faker::Movies::HarryPotter.character,
        body: Faker::Food.description,
        ingredients:[
            Ingredient.new(
                name: Faker::Food.ingredient,
                measure: rand(1..30),
                measure_type: ["ml","litro","grama","kg"].sample
            ),
            Ingredient.new(
                name: Faker::Food.ingredient,
                measure: rand(1..30),
                measure_type: ["ml","litro","grama","kg"].sample
            ),
            Ingredient.new(
                name: Faker::Food.ingredient,
                measure: rand(1..30),
                measure_type: ["ml","litro","grama","kg"].sample
            ),
            Ingredient.new(
                name: Faker::Food.ingredient,
                measure: rand(1..30),
                measure_type: ["ml","litro","grama","kg"].sample
            )
        ],
        method_steps:[
            MethodStep.new(
                step: Faker::Lorem.word
            ),
            MethodStep.new(
                step: Faker::Lorem.word
            ),
            MethodStep.new(
                step: Faker::Lorem.word
            ),
            MethodStep.new(
                step: Faker::Lorem.word
            ),
            MethodStep.new(
                step: Faker::Lorem.word
            ),
        ]
    )

puts ">>> done"