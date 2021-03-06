FactoryGirl.define do
  factory :applicant, class: Applicant do
    name { Faker::Name.name }
    email { Faker::Name.last_name.tr("'", '') + ('a'..'z').to_a.sample + (rand(9)+1).to_s }
    wuid { Faker::Number.number(8) }
    phone_number { Faker::PhoneNumber.phone_number }
    class_standing { ['Freshman', 'Sophomore', 'Junior', 'Senior'].sample }
    gpa { ((rand()*3+1)*100).round/100.0 } # gpa between 1 and 4 with 2 decimal places
    gpa_timestamp { Time.now.strftime('%Y-%m-%d %H:%M:%S') }
    comment { Faker::Lorem.sentence }
    major { ['Computer Science', 'Mathematics', 'Music', 'Theology'].sample }
    minor { ['Accounting', 'Philosophy', 'Dance'].sample }
    work_study { [true, false].sample }
    asc_comments Faker::Lorem.paragraph
    interviewed { [true, false].sample }
    positions { [Position.new(
      professor_comments: Faker::Lorem.paragraph,
      professor_verdict:  [true, false].sample,
      professor_taught:  [true, false].sample,
      application_status:  (0...Status.statuses.count).to_a.sample,
      course: Course.new(
        designator: 'CSCI',
        number:  (100..999).to_a.sample,
        hidden: [true, false].sample),
      professor: Professor.new(name: Faker::Name.name,
                               email: Faker::Name.last_name.tr("'", '')))]}
  end
end
