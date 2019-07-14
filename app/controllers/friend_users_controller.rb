class FriendUsersController < ApplicationController
  before_action :set_user, only: [:delete_user]

  def index
    friend_users = FriendUser.get_users(@system_user.id)
    render :json => {success: true, data: friend_users}
  end

  def delete_user
    unless @user.blank?
      @user.delete
      render :json => {success: true, message: "user deleted successfully"}
    else
      render :json => {success: false, message: "user not found with provided id"}
    end
  end

  private
  def set_user
    @user = FriendUser.find(params[:id]) rescue nil
  end

end
