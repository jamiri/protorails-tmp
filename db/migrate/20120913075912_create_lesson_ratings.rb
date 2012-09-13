class CreateLessonRatings < ActiveRecord::Migration
  def change
    create_table :lesson_ratings do |t|
      t.integer :rating

      t.integer :lesson_id
      t.integer :user_id

      t.timestamps
    end
  end
end
