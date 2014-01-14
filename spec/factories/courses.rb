# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    designator { ["CSCI", "MATH", "ENGL", "PHYS"].sample }
    number { (100..600).to_a.sample }
    hidden { [true, false].sample }
    disabled { [true, false].sample }
  end
end
