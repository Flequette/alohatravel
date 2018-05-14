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
    phone_number: "0698765432",
    description: "Je vis à Phnom Penh depuis 4 ans. J'adore cette ville et le Cambodge. c'est pourquoi je suis très heureux de partager mes bons plans. Et de pouvoir également en découvrir lorsque je voyage.",
    country: "Cambodge",
    city: "Phnom Penh",
    user: user
)
profile.save!
puts "Profile created"

photo_deal_list = [
  "https://scontent-cdg2-1.cdninstagram.com/vp/a3dca40affc3a5f106845b2c78b7dfa9/5B4A6B4A/t51.2885-15/s320x320/e35/28764991_1961185767248801_7483073368942444544_n.jpg",
  "https://scontent-cdg2-1.cdninstagram.com/vp/b5d445a568c7c5d40c4b6fce1af549be/5B48C76A/t51.2885-15/e35/28763134_879007738939968_7832152200338997248_n.jpg",
  "https://scontent-cdg2-1.cdninstagram.com/vp/a21c53624b11788d8c770366816b9c28/5B476856/t51.2885-15/s750x750/sh0.08/e35/28158776_1762922220431650_1778565280331464704_n.jpg",
  "https://scontent-cdg2-1.cdninstagram.com/vp/9006bcf6884689e43c13670d30c9dd33/5B45E2F2/t51.2885-15/s750x750/sh0.08/e35/28434846_210395932846999_3012406416926310400_n.jpg",
  "https://scontent-cdg2-1.cdninstagram.com/vp/c8347d51fa5c1c8cc9a7152263398f63/5B4BA150/t51.2885-15/s750x750/sh0.08/e35/27575301_941470772695424_1762060292243587072_n.jpg",
  ]

p "creation deal"
5.times do
    deal = Deal.create!(
      name: "Les villages flottants de Kompong Khleang",
      description: "Passez une journée aux côtés de locaux qui vous feront découvrir leur histoire, et leur village encore resté authentique à ce jour. Une balade à vélo dans la campagne, un déjeuner entouré des leurs, ainsi qu'un tour en bateau vous montreront ces incroyables constructions flottantes. Une navette viendra vous chercher où vous logez à Siem Reap",
      price: 39,
      address: "Taphul street",
      city: "Siem Reap",
      country: "Cambodge",
      country_code: "855",
      zip_code: "1710",
      inhabitant: "Cambodgien",
      activity_type: "Culturelle",
      time: "1journée",
      tips: "N'oubliez pas de prévoir de l'eau",
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
    country: "Cambodge",
    city: "Siem Reap",
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
        nb_people: 2,
        profile: p,
        deal: c,
    )
    puts b
end

p "test created"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
