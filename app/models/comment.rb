class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :smacktalk

	validates :user_id, presence: true 
end
