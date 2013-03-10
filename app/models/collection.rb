class Collection < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :title, :artist


  validates :title, :presence => true
  validates :artist, :presence => true
end
