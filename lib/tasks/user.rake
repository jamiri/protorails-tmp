namespace :user do

  desc "Create fake users"
  task :create_fake => :environment do

    require 'faker'

    count = ENV['COUNT'] ? ENV['COUNT'].to_i : 1

    count.times do
      User.create!(:name => Faker::Name.name,
                   :mail_address => Faker::Internet.email,
                   :password => '12345',
                   :enable => true)
    end

    puts "#{count} fake users were created."
  end

end