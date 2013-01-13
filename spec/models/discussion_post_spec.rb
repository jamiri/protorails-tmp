# == Schema Information
#
# Table name: discussion_posts
#
#  content         :string(255)
#  created_at      :datetime         not null
#  id              :integer          not null, primary key
#  lesson_id       :integer
#  replied_post_id :integer
#  updated_at      :datetime         not null
#  user_id         :integer
#

require 'spec_helper'

describe DiscussionPost do
  pending "add some examples to (or delete) #{__FILE__}"
end
