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
  serialize :artists
  serialize :genres
  serialize :tracklist
  serialize :styles
  attr_accessible :artists, :title, :year, :released, :notes, :labels, :genres, :discogs_id, :tracklist, :styles

  has_and_belongs_to_many :collections
  has_many :users, :through => :collections

  validates :title, :presence => true
  validates :artists, :presence => true
  validates :discogs_id, :presence => true
  validates :year, :presence => true
end
