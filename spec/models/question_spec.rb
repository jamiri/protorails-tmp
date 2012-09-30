# == Schema Information
#
# Table name: questions
#
#  answer      :string(255)
#  answered_by :string(255)
#  created_at  :datetime         not null
#  id          :integer          not null, primary key
#  lesson_id   :integer
#  question    :string(255)
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'spec_helper'

describe Question do
  pending "add some examples to (or delete) #{__FILE__}"
end
