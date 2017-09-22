class FriendshipsController < ApplicationController
  def index
  	if !user_signed_in?
  		redirect_to root_path, notice: 'You must first Sign in!'
  	else
  		@users=User.all
  		@friendList=current_user.allFriends
      @pendingList=current_user.pendingFriends
      @requestsList=current_user.friendRequests
  	end
  end

  def myFriends
  	if !user_signed_in?
  		redirect_to root_path, notice: 'You must first Sign in!'
  	else
  		@friendList=current_user.allFriends
  	end
  end

  def addFriend
  	if !user_signed_in?
  		redirect_to root_path, notice: 'You must first Sign in!'
  	else
  		f=Friendship.new
  		f.user=current_user
  		f.friend_id=params[:id]
  		f.save
  		redirect_back fallback_location: root_path, notice: 'Friend Request has been Sent'
  	end
  end

  def confirmRequest
    if !user_signed_in?
      redirect_to root_path, notice: 'You must first Sign in!'
    else
      f=Friendship.find_by(user_id:params[:id], friend_id:current_user.id)
      f.confirmation=true
      f.save
      redirect_back fallback_location: root_path, notice: 'Friend Request has been accepted'
    end
  end


end
