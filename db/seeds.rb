# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Deal.destroy_all

Deal.create!([{
  name: "Floating Village",
  description: "blabla",
  location: "Cambodge",
  price: 15,
  photo: "png",
},
{
  name: "Bar",
  description: "blabla",
  location: "France",
  price: 10,
  photo: "png",
},
{
  name: "resto",
  description: "blabla",
  location: "UK",
  price: 25,
  photo: "png",
}])

p "Created #{Deal.count} deals"

Profile.destroy_all

Profile.create!([{
  first_name: "Florine",
  last_name: "Lequette",
  age: 27,
  location: "27 rue esquermoise LILLE",
  phone_number: "0698765432",
  description: "blabla",
},
{
  first_name: "Tiphaine",
  last_name: "Pellet",
  age: 26,
  location: "2 rue de paris PARIS",
  phone_number: "0698765411",
  description: "blablablabla",
}])

p "Created #{Profile.count} profiles"
