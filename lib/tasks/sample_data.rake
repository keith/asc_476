require 'factory_girl_rails'
require 'faker'

namespace :db do
  desc 'Generate sample courses'
  task courses: :environment do
    Course.delete_all
    (1..50).each do |x|
      c = FactoryGirl.build(:course)
      c.save!
    end
  end
end
