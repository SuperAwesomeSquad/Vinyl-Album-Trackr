# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  artist     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  year       :integer
#  released   :datetime
#  notes      :string(255)
#  labels     :string(255)
#  genres     :string(255)
#

class Album < ActiveRecord::Base

  attr_accessible :artist, :title, :year, :released, :notes, :labels, :genres

  # belongs_to :user

  validates :title, :presence => true
  validates :artist, :presence => true
end
