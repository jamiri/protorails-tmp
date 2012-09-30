# == Schema Information
#
# Table name: feedbacks
#
#  comment    :string(255)
#  created_at :datetime         not null
#  email      :string(255)
#  id         :integer          not null, primary key
#  subject    :string(255)
#  updated_at :datetime         not null
#  url        :string(255)
#  user_id    :integer
#  user_name  :string(255)
#

require 'spec_helper'

describe Feedback do
  pending "add some examples to (or delete) #{__FILE__}"
end
