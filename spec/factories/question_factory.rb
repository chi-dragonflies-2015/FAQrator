FactoryGirl.define do
  factory :question do
    content Faker::Lorem.sentence
    answer  Faker::Lorem.paragraph
  end
end