10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

30.times do
  Photographer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    website: Faker::Internet.url,
    bio: Faker::Lorem.paragraph,
    yrs_experience: Faker::Number.between(1, 20),
    zip: Faker::Address::zip
  )
end

photographers = Photographer.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Photographer.count} photographers created"
