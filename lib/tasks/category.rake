namespace :category do

  desc "Generate fake categories"
  task :create_fake => :environment do

    require "faker"

    count = ENV['COUNT'] ? ENV['COUNT'].to_i : 1

    count.times do
      Category.create!(:name => Faker::Lorem.words(rand(1..3)).join(' '),
                       :description => Faker::Lorem.sentences(1))

    end

    puts "#{count} fake categories were created."
  end

  desc "Generate child for categories"
  task :make_child => :environment do

    require "faker"

    Category.where(:name => ENV["name"]).each do |c|

      fake_list = Faker::Lorem.words 3

      fake_list.each do |item|
        cat = Category.new
        cat.name = item
        cat.description = item
        cat.parent = c
        cat.save
      end

    end
  end

  desc "Remove all categories"
  task :clear => :environment do

    Category.delete_all
    puts "All categories removed."

  end

end