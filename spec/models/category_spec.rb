# == Schema Information
#
# Table name: categories
#
#  created_at  :datetime         not null
#  description :string(255)
#  id          :integer          not null, primary key
#  name        :string(255)
#  parent_id   :integer
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Category do
  pending "add some examples to (or delete) #{__FILE__}"
end
