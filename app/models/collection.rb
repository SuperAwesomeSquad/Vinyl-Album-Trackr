class Collection < ActiveRecord::Base
  attr_accessible :title
  belongs_to :user, :primary_key => 'id'
  validates :title, :presence => true
  validates :artist, :presence => true
end
