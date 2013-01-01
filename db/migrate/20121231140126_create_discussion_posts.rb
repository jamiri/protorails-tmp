class CreateDiscussionPosts < ActiveRecord::Migration
  def change
    create_table :discussion_posts do |t|
      t.string :content
      t.integer :replied_post_id
      t.integer :user_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end
