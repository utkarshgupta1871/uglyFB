class LikesController < ApplicationController
  def create
  	if user_signed_in?
  		@like=Like.new
  		@like.user=current_user
  		@like.post_id=params[:id]
  		@like.save
      respond_to do |format|
          format.html {redirect_back fallback_location: root_path}
          format.js
      end
  	else
  		redirect_back fallback_location: root_path, notice: 'You must first Sign in!'
  	end
  end

  def destroy
  	if user_signed_in?
  		@like=Like.find(params[:id])
      @p_id=@like.post_id
  		@like.destroy
  		respond_to do |format|
          format.html {redirect_back fallback_location: root_path}
          format.js
      end
  	else
  		redirect_back fallback_location: root_path, notice: 'You must first Sign in!'
  	end
  end
end
