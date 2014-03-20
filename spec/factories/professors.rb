FactoryGirl.define do
  factory :professor do
    name { Faker::Name.name }
    email { Faker::Name.last_name.tr("'", '') + ('a'..'z').to_a.sample + (rand(9)+1).to_s }
  end
end
