FactoryGirl.define do
  factory :position do
    professor_comments Faker::Lorem.paragraph
    professor_verdict { [true, false].sample }
    professor_taught { [true, false].sample }
    applicant
    professor
    course
  end
end
