
# Users
20.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username  = Faker::Internet.user_name
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!( first_name: first_name,
  				last_name: last_name,
  				username: username,
              	email: email,
              	password: password,
         )
end

# Topics
users = User.all
  users.each { |user| user.topics.create!(title: Faker::Hacker.say_something_smart, description: Faker::Lorem.paragraph ) }


# Following relationships
users = User.all
user  = users.first
following = users[2..20]
followers = users[3..10]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }