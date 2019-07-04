class FriendUsersController < ApplicationController

  def index
    render :json => {success: true, message: "users fetched successfully"}
  end

  def delete_user
    render :json => {success: true, message: "deletion successfully"}
  end

end
