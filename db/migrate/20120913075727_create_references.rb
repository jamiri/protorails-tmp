class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :title
      t.string :description
      t.string :photo

      t.integer :lesson_id

      t.timestamps
    end
  end
end
