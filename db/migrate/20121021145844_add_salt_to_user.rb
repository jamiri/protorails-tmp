class AddSaltToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :salt
    end
  end
end
