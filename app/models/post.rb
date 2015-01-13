class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :recipient, :class_name => "User"

	validates :user_id, presence: true 
	validates :content, presence: true 
end

