# == Schema Information
#
# Table name: blog_posts
#
#  content    :text
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  title      :string(255)
#  updated_at :datetime         not null
#

require 'spec_helper'

describe BlogPost do
  pending "add some examples to (or delete) #{__FILE__}"
end
