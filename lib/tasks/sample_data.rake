namespace :db do
  desc "Generate some sample data"
  task populate: :environment do
    User.delete_all
    make_users
  end
end

def make_users
  FactoryGirl.create(:test)
  FactoryGirl.create(:admin)
  FactoryGirl.create(:moderator)
end

