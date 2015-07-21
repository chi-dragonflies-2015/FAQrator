FactoryGirl.define do
  factory :user do
  	username Faker::Lorem.sentence
  	first_name "Per"
  	last_name "Son"
  	email "person@people.com"
    password "password"
  end 
 end