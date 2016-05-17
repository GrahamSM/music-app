class Track < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :artist, presence: true
	#validates :url, presence: true
end
