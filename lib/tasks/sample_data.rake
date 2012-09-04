require 'faker'

namespace :db do
  desc "Fill db with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin_user = User.create!(:name => "New User", :email => "user@example.com",
                 :password => "foobar", :password_confirmation => "foobar")
    admin_user.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(:name => name, :email => email,
                   :password => password, :password_confirmation => password)
    end

    User.all(:limit => 6).each do |user|
      50.times do
        user.microposts.create!(:content => Faker::Lorem.sentence(5))
      end
    end

  end
end