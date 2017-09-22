class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
##########friends##########
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

	def allFriends
		list=[]
		Friendship.where('user_id== ? and confirmation==?', self.id,true).each do |i|
			list.push i.friend
		end
		Friendship.where('friend_id== ? and confirmation==?', self.id,true).each do |i|
			list.push i.user
		end
		return list
	end
	def pendingFriends
		list=[]
		Friendship.where('user_id== ? and confirmation==?', self.id,false).each do |i|
			list.push i.friend
		end
		return list
	end
	def friendRequests
		list=[]
		Friendship.where('friend_id== ? and confirmation==?', self.id,false).each do |i|
			list.push i.user
		end
		return list
	end
#########################
end
