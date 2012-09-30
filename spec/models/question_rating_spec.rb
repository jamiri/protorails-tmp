# == Schema Information
#
# Table name: question_ratings
#
#  created_at  :datetime         not null
#  id          :integer          not null, primary key
#  question_id :integer
#  rating      :integer
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'spec_helper'

describe QuestionRating do
  pending "add some examples to (or delete) #{__FILE__}"
end
