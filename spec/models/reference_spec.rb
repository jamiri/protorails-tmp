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

require 'spec_helper'

describe Reference do
  pending "add some examples to (or delete) #{__FILE__}"
end
