class Reference < ActiveRecord::Base
  attr_accessible :title, :description, :photo

  belongs_to :lesson
end
