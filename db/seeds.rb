# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: false,
               )
end
User.create!(name: "管理者",
             email: "admin@admin.com",
             password: "111111",
             password_confirmation: "111111",
             admin: true)

10.times do |i|
  Label.create!(name: "sample#{i + 1}")
end

10.times do |i|
  Task.create!(
    title: "test#{i + 1}",
    content: "テスト",
    deadline: "2022-05-05",
    priority: rand(0..2),
    status: rand(0..2),
)
end
