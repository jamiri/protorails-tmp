class AddColumnsToContentSuggestion < ActiveRecord::Migration
  def change
    add_column :content_suggestions, :user_id, :integer
    add_column :content_suggestions, :title, :string
    add_column :content_suggestions, :cat_1, :string
    add_column :content_suggestions, :cat_2, :string
    add_column :content_suggestions, :cat_3, :string
    add_column :content_suggestions, :summary, :string
    add_column :content_suggestions, :goal, :string
    add_column :content_suggestions, :market, :string
    add_column :content_suggestions, :audience, :string
    add_column :content_suggestions, :other_available_product, :string
    add_column :content_suggestions, :product, :text
    add_column :content_suggestions, :content_overview, :text
    add_column :content_suggestions, :illustration, :string
    add_column :content_suggestions, :marketing_promotion, :string
    add_column :content_suggestions, :author_qualification, :string
    add_column :content_suggestions, :appendice, :string
  end
end
