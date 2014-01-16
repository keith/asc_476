require 'factory_girl_rails'
require 'faker'

namespace :db do
  desc 'Generate some sample data'
  task populate: :environment do
    User.delete_all
    make_users
    make_courses
  end
end

def make_users
  FactoryGirl.create(:test)
  FactoryGirl.create(:admin)
  FactoryGirl.create(:moderator)
end

def make_courses
  (1..50).each do |x|
    c = FactoryGirl.build(:course)
    c.save
  end
end

