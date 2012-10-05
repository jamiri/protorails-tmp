# == Schema Information
#
# Table name: glossary_entries
#
#  created_at       :datetime         not null
#  ext_link         :string(255)
#  full_definition  :text
#  id               :integer          not null, primary key
#  image_file       :string(255)
#  name             :string(255)
#  pronun_file      :string(255)
#  short_definition :string(255)
#  updated_at       :datetime         not null
#

class GlossaryEntry < ActiveRecord::Base
  attr_accessible :name, :short_definition, :full_definition,
                  :pronun_file, :image_file, :ext_link

  has_and_belongs_to_many :lessons

  scope :for_lesson, lambda { |lesson_id| joins(:lessons).where('lesson_id = ?', lesson_id) }
  scope :lookup,     lambda { |term|      where(:name => term) }
end
