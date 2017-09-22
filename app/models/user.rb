class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  
##########friends##########
  has_many :friendships
  has_many :friends, through: :friendships

	def allFriends
		list=[]
		Friendship.where('user_id== ?', self.id).each do |i|
			list.push i.friend
		end
		Friendship.where('friend_id== ?', self.id).each do |i|
			list.push i.user
		end
		return list
	end
#########################
end
