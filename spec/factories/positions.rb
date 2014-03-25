FactoryGirl.define do
  factory :position do
    professor_comments Faker::Lorem.paragraph
    professor_verdict { [true, false].sample }
    professor_taught { [true, false].sample }
    application_status { rand(Status.names.count).to_s }
    asc_comments Faker::Lorem.paragraph
    applicant
    professor
    course
  end
end
