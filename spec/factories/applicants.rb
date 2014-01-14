# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :applicant, class: Applicant do
    name { Faker::Name.name }
    email { Faker::Name.first_name + ('a'..'z').to_a[rand(26)] + (rand(9)+1).to_s + "@winthrop.edu" }
    wuid { Faker::Number.number(8) }
    phone_number { Faker::PhoneNumber.phone_number }
    class_standing { ["Freshman", "Sophomore", "Junior", "Senior"].sample }
    gpa { ((rand()*3+1)*100).round/100.0 } # gpa between 1 and 4 with 2 decimal places
    gpa_timestamp { Time.now.strftime("%Y-%m-%d %H:%M:%S") }
    comment { Faker::Lorem.sentence }
    major { ["Computer Science", "Mathematics", "Music", "Theology"].sample }
    minor { ["Accounting", "Philosophy", "Dance"].sample }
    work_study { [true, false].sample }
  end
end
