# == Schema Information
#
# Table name: references
#
#  created_at  :datetime         not null
#  description :string(255)
#  id          :integer          not null, primary key
#  lesson_id   :integer
#  photo       :string(255)
#  title       :string(255)
#  updated_at  :datetime         not null
#

class Reference < ActiveRecord::Base
  attr_accessible :title, :description, :photo

  belongs_to :lesson
end
