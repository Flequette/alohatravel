# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Booking.destroy_all
Deal.destroy_all
Profile.destroy_all
User.destroy_all


p "creation user"
user = User.new(
    email: "user@hotmail.fr",
    password: "123456"
)
user.save!
p "user created"

p "creation profile"
profile = Profile.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: 27,
    location: "27 rue esquermoise LILLE",
    phone_number: "0698765432",
    description: "blabla",
    user: user
)
profile.save!
puts "Profile created"

photo_deal_list = [
  "https://unsplash.com/photos/1ms2mtK6izM",
  "https://unsplash.com/photos/wAn4RfmXtxU",
  "https://unsplash.com/photos/3Z70SDuYs5g",
  "https://unsplash.com/photos/VeKqfHaa3e4",
  "https://unsplash.com/photos/mS1pAG_bi5Y",
  ]

p "creation deal"
5.times do
    deal = Deal.create!(
      name: "Floating Village",
      description: "blabla",
      location: "Cambodge",
      price: 15,
      profile: profile
    )

    deal.remote_photo_url = photo_deal_list.sample
    deal.save
    puts "Deal created"
end

p "creation booking"
n = 1
users = []
10.times do
    u = User.create!(
        email: "user#{n}@hotmail.fr",
        password: "123456"
    )
    users << u
    p = Profile.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: 27,
    location: "27 rue esquermoise LILLE",
    phone_number: "0698765432",
    description: "blabla",
    photo: "https://unsplash.com/photos/1ms2mtK6izM",
    user: u
    )
    n += 1
end

p "booking created"

p "creation test"

(5..20).to_a.sample.times do
    p = users.sample.profile
    puts p
    c = Deal.all.sample
    puts c
    b = Booking.create!(
        start_date: Faker::Date.between(14.days.ago, 7.days.ago),
        end_date: Faker::Date.between(6.days.ago, 1.days.ago),
        status: "En cours",
        message: Faker::Seinfeld.quote,
        profile: p,
        deal: c,
    )
    puts b
end

p "test created"

