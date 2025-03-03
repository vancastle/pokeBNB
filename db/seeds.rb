require 'faker'

10.times do
  User.create(
    user_name: Faker::Name.name,
    email: Faker::Internet.email(domain: 'gmail.com'),
    paswword: Faker::Internet.password
  )
end
