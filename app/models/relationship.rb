class Relationship < ActiveRecord::Base

	validates :follower_id, presence: true
	validates :following_id, presence: true

	belongs_to :following_user, class_name: 'User', foreign_key: :follower_id
	belongs_to :followed_user, class_name: 'User', foreign_key: :following_id

end
