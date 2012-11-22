class AddImageFileToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :image_file, :string
  end
end
