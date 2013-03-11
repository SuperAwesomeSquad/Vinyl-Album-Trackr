# == Schema Information
#
# Table name: collections
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  artist     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'spec_helper'

describe Collection do
  pending "add some examples to (or delete) #{__FILE__}"
end
