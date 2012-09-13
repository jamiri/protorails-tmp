class CreateContentSuggestions < ActiveRecord::Migration
  def change
    create_table :content_suggestions do |t|
      t.string :user_name
      t.string :email
      t.string :subject
      t.string :comment
      t.string :url

      t.integer :user_id

      t.timestamps
    end
  end
end
