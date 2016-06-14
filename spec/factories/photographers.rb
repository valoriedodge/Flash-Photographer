FactoryGirl.define do
  pw = Faker::Internet.password
  factory :photographer do
      sequence(:email){|n| "user#{n}@factory.com" }
      password pw
      password_confirmation pw
      first_name Faker::Name.first_name
      last_name Faker::Name.last_name
      website Faker::Internet.url
      bio Faker::Lorem.paragraph
      yrs_experience Faker::Number.between(1, 20)
      zip Faker::Address::zip
  end
end
