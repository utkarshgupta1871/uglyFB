class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  
  def show
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path, notice: 'Profile Updated successfully.' }
      else
        format.html {  redirect_back fallback_location: root_path, notice: 'Error!!! Please try again.'  }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :attachment)
    end
end
