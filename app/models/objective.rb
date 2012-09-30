# == Schema Information
#
# Table name: objectives
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  title      :string(255)
#  updated_at :datetime         not null
#

class Objective < ActiveRecord::Base
  attr_accessible :title

  belongs_to :lesson

  def to_s
    title
  end
end
