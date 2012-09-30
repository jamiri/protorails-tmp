# == Schema Information
#
# Table name: comments
#
#  blog_post_id :integer
#  comment      :text
#  created_at   :datetime         not null
#  id           :integer          not null, primary key
#  updated_at   :datetime         not null
#  user_id      :integer
#

require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
