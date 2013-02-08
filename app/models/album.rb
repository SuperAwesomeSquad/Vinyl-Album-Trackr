class Album < ActiveRecord::Base
  attr_accessible :artist, :title, :year, :released, :notes, :labels, :genres


  validates :title, :presence => true
  validates :artist, :presence => true
end
