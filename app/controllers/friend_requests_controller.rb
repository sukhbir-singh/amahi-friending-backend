class FriendRequestsController < ApplicationController

  def index
    render :json => {success: true, message: "requests fetched successfully"}
  end

  def create_request
    render :json => {success: true, message: "new request created successfully"}
  end

  def resend_request
    render :json => {success: true, message: "request resend successfully"}
  end

  def delete_request
    render :json => {success: true, message: "request deleted successfully"}
  end

end
