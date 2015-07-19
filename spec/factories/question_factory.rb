FactoryGirl.define do
  factory :question do
    topic
    content Faker::Lorem.sentence
    answer  Faker::Lorem.paragraph
  end
end