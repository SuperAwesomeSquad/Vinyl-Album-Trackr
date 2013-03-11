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

class Collection < ActiveRecord::Base
  attr_accessible :name, :title, :artist

  has_and_belongs_to_many :albums
  belongs_to :user

end
