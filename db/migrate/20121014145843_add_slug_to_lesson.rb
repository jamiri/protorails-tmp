class AddSlugToLesson < ActiveRecord::Migration
  def change
    change_table :lessons do |t|
      t.string :slug
      t.index :slug, :unique => true
    end
  end
end
