FactoryGirl.define do
  factory :review do
    comment Faker::Lorem.sentence
    photographer
    user
  end
end
