FactoryGirl.define do
  factory :topic do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    primary_color ["blue", "green", "red", "purple", "orange"].sample
    association :user, factory: :user
  end

end