require 'open-uri'

puts 'Cleaning DB...'

Console.destroy_all

puts 'Cleaning done'


puts 'Seeding...'

new_console = Console.new(
  name: ,
  model: ,
  content: ,
  price_per_day: ,
)

nico = User.find(1)
jerem = User.find(2)

users = [nico, jerem]

new_console.user = users.sample

new_console.save!

consoles = ["Game Boy",
 "Tamagotchi",
 "Nintendo Switch",
 "PlayStation 3",
 "PlayStation 4",
 "PlayStation 5",
 "Wii",
 "Xbox",
 "Xbox 360",
 "Xbox One",
 "Xbox Series X"]

i = 1

selected_console = consoles.sample.gsub(' ', '')
rand(3..5).times do
  file = URI.open(Faker::LoremFlickr.image(size: "1000x1000", search_terms: ['gaming', 'console', "#{selected_console}"], match_all: true))
  new_console.photo.attach(io: file, file_name: "#{selected_console}-#{i}.jpeg", content_type: 'image/jpeg')
  i += 1
end
puts 'Seeding done:'
puts "#{Console.count} created"
