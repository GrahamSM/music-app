class Track < ActiveRecord::Base
	has_and_belongs_to_many :users
	validates :title, presence: true
	validates :artist, presence: true
	#embeddable_url = url.sub('watch?v=', 'embed/')
	#validates :url, presence: true

	def embeddable_url
		url.sub('watch?v=', 'embed/')
	end

	def get_all_reviews
		reviews = Review.all
		my_reviews = []
		reviews.each do |review|
			if review.track_id == id
				my_reviews << review #Push content of the review on to my_reviews
			end
		end
		return my_reviews
	end
end
