class Track < ActiveRecord::Base
	validates :title, presence: true
	validates :artist, presence: true
	validates :author, presence: true
	#validates :url, presence: true
end
