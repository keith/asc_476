# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :applicant do
    name "MyString"
    email "MyString"
    wuid "MyString"
    phone_number "MyString"
    class_standing "MyString"
    gpa 1.5
    gpa_timestamp "2014-01-06 13:20:20"
    comment "MyText"
    major "MyString"
    minor "MyString"
    work_study false
  end
end
