class Upvote < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: [:track_id]
end
