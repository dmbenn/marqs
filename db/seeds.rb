require 'faker'

#Adding Standard Test Users
5.times do 
  user = User.new(
    email:  Faker::Internet.email,
    password: Faker::Lorem.characters(10),
    )
  user.save!
end

#Test test User
test = User.new(
  email:      'test@example.com',
  password:   'testtest',
)
test.save!

users = User.all

#fake Topics
15.times do
  Topic.create(
    title:  Faker::Lorem.characters(10),
    user: users.sample
  )
end

topics = Topic.all

40.times do
  Bookmark.create(
    topic: topics.sample,
    url: Faker::Internet.url
    )
end


puts "Seed Finished"
puts "#{User.count} users created"