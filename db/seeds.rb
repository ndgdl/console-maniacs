require 'open-uri'

puts 'Cleaning DB...'

Console.all.each do |console|
  console.photos.purge
  console.destroy
end

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

puts 'Seeding consoles...'

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

count = 1
rand(5..10).times do
 puts "Creating #{count} console"
 new_console_name = consoles.sample
 new_console = Console.new(
  name: new_console_name,
  model: new_console_name.split[0],
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  price_per_day: rand(25.0..75.0).round(2)
)

  new_console.user = User.all.sample

  i = 1
  3.times do
   file = URI.open("https://loremflickr.com/1000/1000/gaming,console,#{new_console_name.gsub(' ', '').downcase}/all")
   new_console.photos.attach(io: file, filename: "#{new_console_name.gsub(' ', '')}-#{i}.jpg", content_type: 'image/jpg')
   i += 1
  end

  new_console.save
  puts "Console number##{count} created"
end

puts 'Seeding done:'
puts "#{Console.count} consoles created"
