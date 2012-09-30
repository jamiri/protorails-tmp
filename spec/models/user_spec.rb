# == Schema Information
#
# Table name: users
#
#  created_at   :datetime         not null
#  enable       :boolean
#  id           :integer          not null, primary key
#  mail_address :string(255)
#  name         :string(255)
#  password     :string(255)
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
