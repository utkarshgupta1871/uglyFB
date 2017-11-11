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
  		@f=Friendship.new
  		@f.user=current_user
  		@f.friend_id=params[:id]
  		@f.save
      respond_to do |format|
          format.html {redirect_back fallback_location: root_path, notice: 'Friend Request has been Sent'}
          format.js
      end

  	end
  end

  def confirmRequest
    if !user_signed_in?
      redirect_to root_path, notice: 'You must first Sign in!'
    else
      @f=Friendship.find_by(user_id:params[:id], friend_id:current_user.id)
      @f.confirmation=true
      @f.save
      respond_to do |format|
          format.html {redirect_back fallback_location: root_path, notice: 'Friend Request has been accepted'}
          format.js
      end
    end
  end

  def findFriends
    @users=User.where('name like ?', ('%'+params[:term]+'%'))
    users_list=[]
    @users.each do |u|
      user=Hash.new
      user[:id]=u.id
      user[:value]=u.name
      user[:label]=u.name
      users_list<<user
    end

    return render json: users_list


  end


end
