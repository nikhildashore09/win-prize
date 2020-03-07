# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

prize_list = ['fancy dinner', 'kid\'s toy', 'free bottle of perfume']

prize_list.each do |name|
  Prize.create!(name: name)
end