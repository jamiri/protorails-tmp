# == Schema Information
#
# Table name: content_suggestions
#
#  content    :string(255)
#  created_at :datetime         not null
#  email      :string(255)
#  id         :integer          not null, primary key
#  name       :string(255)
#  subject    :string(255)
#  updated_at :datetime         not null
#

class ContentSuggestion < ActiveRecord::Base
  attr_accessible :name, :email, :subject, :content
end
