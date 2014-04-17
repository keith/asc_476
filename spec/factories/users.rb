# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test, class: User do
    name 'Test User'
    email 'test@example.com'
    password 'abcdef'
    password_confirmation 'abcdef'
    level 0
  end

  factory :admin, class: User do
    email    { Faker::Internet.email }
    name     { Faker::Name.name }
    password 'abcdef'
    password_confirmation 'abcdef'
    level 0
  end

  factory :moderator, class: User do
    name     { Faker::Name.name }
    email    { 'mod@example.com' }
    password 'abcdef'
    password_confirmation 'abcdef'
    level 2
  end
end
