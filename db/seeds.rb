# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

5.times do
  @chef = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    is_chef: true,
    # price: 50.99,
    # description: Faker::Lorem.sentence,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
  # chef.skip_confirmation!
end
