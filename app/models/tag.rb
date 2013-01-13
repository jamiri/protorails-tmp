# == Schema Information
#
# Table name: tags
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string(255)
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :lessons

end
