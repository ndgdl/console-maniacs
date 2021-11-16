require 'open-uri'

puts 'Cleaning DB...'

Console.destroy_all
User.all.each do |user|
  user.photo.purge if user.photo.attached?
  user.destroy
end

puts 'Cleaning done'

puts 'Seeding users...'

puts 'Creating Alexandre...'
alexandre = User.new(
  first_name: "Alexandre",
  last_name: "Havard",
  phone_number: "+33600000000",
  email: "havard@test.com",
  password: "password",
  password_confirmation: "password"
)
file = URI.open('https://avatars.githubusercontent.com/u/87811770?v=4')
alexandre.photo.attach(io: file, filename: 'alexandre.jpg', content_type: 'image/png')
alexandre.save
puts 'Seeding done:'

puts 'Creating Alex...'
alex = User.new(
  first_name: "Alex",
  last_name: "Vigreux",
  phone_number: "+33600000000",
  email: "vigreux@test.com",
  password: "password",
  password_confirmation: "password"
)
file = URI.open('https://avatars.githubusercontent.com/u/87474835?v=4')
alex.photo.attach(io: file, filename: 'alex.jpg', content_type: 'image/png')
alex.save

puts 'Creating Jérémy...'
jeremy = User.new(
  first_name: "Jérémy",
  last_name: "Blondeau",
  phone_number: "+33600000000",
  email: "blondeau@test.com",
  password: "password",
  password_confirmation: "password"
)
file = URI.open('https://avatars.githubusercontent.com/u/86318433?v=4')
jeremy.photo.attach(io: file, filename: 'jeremy.jpg', content_type: 'image/png')
jeremy.save

puts 'Creating Nicolas...'
nicolas = User.new(
  first_name: "Nicolas",
  last_name: "de Guilhem",
  phone_number: "+33600000000",
  email: "deguilhem@test.com",
  password: "password",
  password_confirmation: "password"
)
file = URI.open('https://avatars.githubusercontent.com/u/88536137?v=4')
nicolas.photo.attach(io: file, filename: 'nicolas.jpg', content_type: 'image/png')
nicolas.save


puts 'Seeding done:'
puts "#{User.count} users created"


# puts 'Seeding...'

# new_console = Console.new(
#   name: ,
#   model: ,
#   content: ,
#   price_per_day: ,
# )

# nico = User.find(1)
# jerem = User.find(2)

# users = [nico, jerem]

# new_console.user = users.sample

# new_console.save!

# consoles = ["Game Boy",
#  "Tamagotchi",
#  "Nintendo Switch",
#  "PlayStation 3",
#  "PlayStation 4",
#  "PlayStation 5",
#  "Wii",
#  "Xbox",
#  "Xbox 360",
#  "Xbox One",
#  "Xbox Series X"]

# i = 1

# selected_console = consoles.sample.gsub(' ', '')
# rand(3..5).times do
#   file = URI.open(Faker::LoremFlickr.image(size: "1000x1000", search_terms: ['gaming', 'console', "#{selected_console}"], match_all: true))
#   new_console.photo.attach(io: file, file_name: "#{selected_console}-#{i}.jpeg", content_type: 'image/jpeg')
#   i += 1
# end
# puts 'Seeding done:'
# puts "#{Console.count} created"
