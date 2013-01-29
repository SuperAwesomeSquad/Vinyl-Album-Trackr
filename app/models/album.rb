class Album < ActiveRecord::Base
  attr_accessible :artist, :title


  validates :title, :presence => true
  validates :artist, :presence => true
end
