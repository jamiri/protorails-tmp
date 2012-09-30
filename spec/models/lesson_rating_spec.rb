# == Schema Information
#
# Table name: lesson_ratings
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  rating     :integer
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'spec_helper'

describe LessonRating do
  pending "add some examples to (or delete) #{__FILE__}"
end
