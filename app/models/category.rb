# == Schema Information
#
# Table name: categories
#
#  created_at  :datetime         not null
#  description :string(255)
#  id          :integer          not null, primary key
#  name        :string(255)
#  parent_id   :integer
#  updated_at  :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :sub_categories, :class_name => "Category",
           :foreign_key => "parent_id"

  belongs_to :parent, :class_name => "Category"

  has_many :lessons, :foreign_key => "category_id"
end
