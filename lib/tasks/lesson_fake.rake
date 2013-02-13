
namespace :lesson do

  desc "Create fake less.sass"
  task :create_fake => :environment do

    require 'faker'

    count = ENV['COUNT'] ? ENV['COUNT'].to_i : 1

    count.times do
      lesson_script = Faker::Lorem.paragraphs(rand(5..30))

      lesson = Lesson.new(
          :title => Faker::Lorem.sentence(rand(1..7)), # maximum title length = 7 words
          :description => Faker::Lorem.paragraph(rand(1..3)), # maximum description length = 7 sentences
          :script => lesson_script.map{ |x| "<p>#{x}</p>" }.join(''), # maximum script length = 30 paragraphs
          :author => Faker::Name.name
      )

      # category
      lesson.category = Category.all.sample

      # objectives
      rand(1..5).times do
        lesson.objectives.build(:title => Faker::Lorem.sentence(rand(5..10)))
      end

      # references
      rand(1..5).times do
        lesson.references.build(
            :title => Faker::Lorem.words(rand(2..5)).join(' '),
            :description => Faker::Lorem.sentences(rand(1..3)).join(' ')
        )
      end

      # questions
      rand(2..5).times do
        lesson.questions.build(
            :user => User.all.sample,
            :question => Faker::Lorem.sentence(rand(5..20)),
            :answer => Faker::Lorem.sentences(rand(1..5)).join(' '),
            :answered_by => Faker::Name.name
        )
      end

      # glossary
      sample_words = lesson_script.join(' ').scan(%r{\w+}).uniq.sample(rand(5..10))
      sample_words.each do |word|
        if word.length > 2
          lesson.glossary_entries.build(
              :name => word,
              :short_definition => Faker::Lorem.sentences(1).first,
              :full_definition => Faker::Lorem.sentences(rand(2..5)).join(''),
          )
        end
      end

      # microblog
      rand(0..10).times do
        blogpost = BlogPost.new(
            :title => Faker::Lorem.sentence(rand(2..10)),
            :content => Faker::Lorem.paragraphs(rand(1..5)).join(' ')
        )

        rand(0..10).times do
          blogpost.comments << Comment.new(
              :comment => Faker::Lorem.sentences(rand(1..5)).join(' '),
              :user => User.all.sample
          )
        end

        lesson.blog_posts << blogpost
      end

      # Save the lesson!
      lesson.save

      puts "A new lesson was created. The id is #{lesson.id}."
    end
  end

end