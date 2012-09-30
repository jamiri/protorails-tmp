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

require 'spec_helper'

describe GlossaryEntry do
  pending "add some examples to (or delete) #{__FILE__}"
end
