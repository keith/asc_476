# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin, class: User do
    email    { Faker::Internet.email }
    name     { Faker::Name.name }
    password 'foobarbaz'
    password_confirmation 'foobarbaz'
    level 0
  end

  factory :moderator, class: User do
    email    { Faker::Internet.email }
    name     { Faker::Name.name }
    password 'foobarbaz'
    password_confirmation 'foobarbaz'
    level 2
  end
end
