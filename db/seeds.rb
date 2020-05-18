User.destroy_all
Character.destroy_all
Campaign.destroy_all
Membership.destroy_all

users = []
campaigns = []
characters = []


10.times do
  User.create do |u|
      u.name = Faker::Name.name
      u.username = Faker::Internet.username(specifier: u.name)
      u.bio = Faker::Lorem.sentence
      u.city = Faker::Address.city
      u.state = Faker::Address.state 
      u.email = Faker::Internet.email(name: u.name, separators: '-')
      u.password = 'password'
      users << u
    end
end

30.times do
  Character.create do |c|
    c.name = Faker::Name.name 
    c.user = users.sample
    c.race = 
    c.level = Faker::Number.non_zero_digit
    c.background = Faker::Lorem.paragraph
    characters << c
  end
end

4.times do
  Campaign.create do |c|
      c.name = Faker::Name.name
      c.location = Faker::Address.city
      c.story = Faker::Lorem.paragraph
      c.lvl = Faker::Number.within(range: 1..10)
      c.owner = users.sample
      campaigns << c
  end
end

10.times do
  Membership.create do |m|
    m.character = characters.sample 
    m.campaign = campaigns.sample
    m.user = users.sample
  end
end
