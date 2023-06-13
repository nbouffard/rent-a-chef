# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'
require 'json'

User.destroy_all
12.times do
  file = URI.open('https://i.pravatar.cc/300')
  @chef = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    is_chef: true,
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    password: 123456,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    city: Faker::Address.city,
    price: (rand 50..100)
  )
  @chef.profile_photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  @chef.save!
end
