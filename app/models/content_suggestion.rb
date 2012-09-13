class ContentSuggestion < ActiveRecord::Base
  attr_accessible :user_name, :email, :subject, :comment, :url

  belongs_to :user
end
