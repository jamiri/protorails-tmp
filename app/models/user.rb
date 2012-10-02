# == Schema Information
#
# Table name: users
#
#  created_at   :datetime         not null
#  enable       :boolean
#  id           :integer          not null, primary key
#  mail_address :string(255)
#  name         :string(255)
#  password     :string(255)
#  updated_at   :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :mail_address, :password, :enable, :password_confirmation


  has_many :comments, :foreign_key => 'user_id'
  has_many :questions, :foreign_key => 'user_id'
  has_many :lesson_ratings, :foreign_key => 'user_id'
  has_many :feedbacks
end
