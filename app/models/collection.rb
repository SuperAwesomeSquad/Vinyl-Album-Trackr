class Collection < ActiveRecord::Base
  attr_accessible :name, :title, :artist


  validates :title, :presence => true
  validates :artist, :presence => true
end
