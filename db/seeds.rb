# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(
  first_name: "Mike",
  last_name: "Wagner",
  username: "mikeywagner",
  email: "wagnerdmike@gmail.com",
  password: "mikeywagner",
  description: "Loves coding, music, reading and solving puzzles. Obsessed with pigs."
)

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Hipster.word,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    description: Faker::Lorem.paragraph
  )
end

User.all.each do |user|
  12.times do
    Post.create!(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      author_id: user.id,
      created_at: Faker::Time.backward(100)
    )
  end
end

User.all.each do |user|
  20.times do
    id = rand(1..119)
    Post.find(id).comments.create!(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      author_id: user.id,
      post_id: id,
      created_at: Faker::Time.backward(100)
    )
  end
end
