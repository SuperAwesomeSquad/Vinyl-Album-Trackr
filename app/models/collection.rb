class Collection < ActiveRecord::Base
  attr_accessible :name, :title, :artist

  has_and_belongs_to_many :albums
  belongs_to :user

  validates :title, :presence => true
  validates :artist, :presence => true
end
