class FriendUsersController < ApplicationController
  before_action :set_user, only: [:delete_user]

  def index
    render :json => {success: true, data: FriendUser.all.as_json}
  end

  def create_user
    user = FriendUser.create(params_create_user(params))
    if user.save
      render :json => {success: true, message: "new friend user created successfully", friend_user: user}
    else
      render :json => {success: false, errors: user.errors.full_messages.as_json}
    end
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

  def params_create_user(params)
    params.permit(:email)
  end
end
