# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :position do
    professor_comments "MyText"
    professor_verdict false
    professor_taught false
    application_status 1
    asc_comments "MyText"
  end
end
