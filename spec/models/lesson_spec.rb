# == Schema Information
#
# Table name: lessons
#
#  audio_file  :string(255)
#  author      :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  description :string(255)
#  id          :integer          not null, primary key
#  image_file  :string(255)
#  script      :text
#  slug        :string(255)
#  title       :string(255)
#  updated_at  :datetime         not null
#  video_file  :string(255)
#

require 'spec_helper'

describe Lesson do
  pending "add some examples to (or delete) #{__FILE__}"
end
