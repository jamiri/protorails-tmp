# == Schema Information
#
# Table name: content_suggestions
#
#  appendice               :string(255)
#  audience                :string(255)
#  author_qualification    :string(255)
#  cat_1                   :string(255)
#  cat_2                   :string(255)
#  cat_3                   :string(255)
#  content_overview        :text
#  created_at              :datetime         not null
#  email                   :string(255)
#  goal                    :string(255)
#  id                      :integer          not null, primary key
#  illustration            :string(255)
#  market                  :string(255)
#  marketing_promotion     :string(255)
#  name                    :string(255)
#  other_available_product :string(255)
#  product                 :text
#  subject                 :string(255)
#  summary                 :string(255)
#  title                   :string(255)
#  updated_at              :datetime         not null
#  user_id                 :integer
#

require 'spec_helper'

describe ContentSuggestion do
  pending "add some examples to (or delete) #{__FILE__}"
end
