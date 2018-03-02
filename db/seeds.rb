# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Deal.destroy_all

puts 'Creating deals...'
deals_attributes = [
  {
    name:         'Floating Village',
    address:      'Siem Reap, Cambodia',
    description:  'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum, modi veritatis laboriosam voluptas perferendis ab facere incidunt id, non accusamus facilis iure officia, quo ullam magnam minima omnis culpa explicabo.',
    price:        20
  },
  {
    name:         'Westglitten',
    address:      'Copenhagen, Denmark',
    description:  'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid fuga consectetur voluptatibus qui magni debitis, quasi vitae expedita adipisci ut fugit perferendis, dignissimos ipsa ab ea. Culpa deserunt sequi ab.',
    stars:        15
  }
]
Deal.create!(deals_attributes)
puts 'Finished!'
