FactoryGirl.define do
  factory :rant do
    title Faker::Lorem.word
    body Faker::Lorem.sentence
  end
end
