class ContentSuggestion < ActiveRecord::Base
  attr_accessible :user_id, :name, :email, :subject,  :title, :cat_1, :cat_2, :cat_3, :summary, :goal, :market, :audience,
                  :other_available_product, :product, :content_overview, :illustration, :marketing_promotion,
                  :author_qualification, :appendice
  belongs_to :user
end
