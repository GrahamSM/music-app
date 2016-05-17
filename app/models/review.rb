class Review < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: {in: 2..200}
  validates_uniqueness_of :user_id, scope: [:track_id]
end
