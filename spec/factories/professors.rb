FactoryGirl.define do
  factory :professor do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
