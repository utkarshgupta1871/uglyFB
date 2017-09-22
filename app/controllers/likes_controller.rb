class LikesController < ApplicationController
  def create
  	if user_signed_in?
  		@like=Like.new
  		@like.user=current_user
  		@like.post_id=params[:id]
  		@like.save
  		redirect_back fallback_location: root_path
  	else
  		redirect_back fallback_location: root_path, notice: 'You must first Sign in!'
  	end
  end

  def destroy
  	if user_signed_in?
  		@like=Like.find_by(params[:id])
  		@like.destroy
  		redirect_back fallback_location: root_path
  	else
  		redirect_back fallback_location: root_path, notice: 'You must first Sign in!'
  	end
  end
end
