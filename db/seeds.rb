# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

User.create(email: 'igor@gmail.com', name: 'Igor', password: "123456")
def get_text
  text = ""
  20.times do
    text += "#{Faker::Lorem.paragraph} "
  end
  return text
end

10.times do
  FundraiseOffer.create(
    organization_name: Faker::Company.name,
    segment: Faker::Commerce.department,
    offer_type: Faker::Games::LeagueOfLegends.rank,
    pitch_deck: get_text,
    fundraise_target: Faker::Number.decimal,
    organization_logo: 'logo.png',
    organization_thumbnail: 'logo.png'
  )
end
