namespace :db do
  desc "Generate some sample data"
  task populate: :environment do
    make_users
  end
end

def make_users
  User.create!(email: "test@example.com",
                password: "abcdef",
                password_confirmation: "abcdef",
                level: 0)
end

