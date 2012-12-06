class RemoveContentFromContentSuggestion < ActiveRecord::Migration
  def up
    remove_column :content_suggestions, :content
      end

  def down
    add_column :content_suggestions, :content, :string
  end
end
