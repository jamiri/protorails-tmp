class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :question
      t.string  :answer
      t.string  :answered_by

      t.integer :lesson_id
      t.integer :user_id

      t.timestamps
    end
  end
end
