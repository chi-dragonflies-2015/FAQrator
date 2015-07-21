FactoryGirl.define do
  factory :topic do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    association :user, factory: :user
  end

end