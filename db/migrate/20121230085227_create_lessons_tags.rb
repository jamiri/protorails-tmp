class CreateLessonsTags < ActiveRecord::Migration
  def change
    create_table :lessons_tags, :id => false do |t|
      t.integer :lesson_id
      t.integer :tag_id
    end
  end
end
