class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :posts

    has_many :smacktalks

    has_many :comments

    has_many :relationships, foreign_key: :follower_id
    has_many :users_followed, through: :relationships, source: :followed_user

    has_many :inverse_relationships, foreign_key: :following_id, class_name: 'Relationship'
    has_many :followers, through: :inverse_relationships, source: :following_user

end



