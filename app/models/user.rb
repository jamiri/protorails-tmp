class User < ActiveRecord::Base
  attr_accessible :name, :mail_address, :password, :enable

  has_many :comments, :foreign_key => 'user_id'
  has_many :questions, :foreign_key => 'user_id'
  has_many :lesson_ratings, :foreign_key => 'user_id'
  has_many :feedbacks
end
