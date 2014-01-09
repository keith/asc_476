namespace :db do
  desc "Generate some sample data"
  task populate: :environment do
    make_users
  end
end

def make_users
  FactoryGirl.create(:admin)
end

