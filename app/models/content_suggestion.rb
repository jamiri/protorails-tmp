class ContentSuggestion < ActiveRecord::Base
  attr_accessible :name, :email, :subject, :content
end
