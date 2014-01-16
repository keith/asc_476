require 'factory_girl_rails'
require 'faker'

namespace :db do
  desc 'Generate some sample data'
  task populate: :environment do
    make_users
    make_courses
  end
end

def make_users
  User.delete_all
  FactoryGirl.create(:test)
  FactoryGirl.create(:admin)
  FactoryGirl.create(:moderator)
end

def make_courses
  Course.delete_all
  (1..50).each do |x|
    c = FactoryGirl.build(:course)
    c.save!
  end
end

