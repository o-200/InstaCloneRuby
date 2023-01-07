class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy

  has_many :followers, class_name: 'FollowersRelationship', foreign_key: 'followed_id'
  has_many :followings, class_name: 'FollowersRelationship', foreign_key: 'follower_id'
end
