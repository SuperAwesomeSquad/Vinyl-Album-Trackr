class Album < ActiveRecord::Base
  attr_accessible :artist, :title
  belongs_to :user

  validates :title, :presence => true
  validates :artist, :presence => true
end
