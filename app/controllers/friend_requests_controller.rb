class FriendRequestsController < ApplicationController

  def index
    render :json => {success: true, message: "requests fetched successfully"}
  end

  # Add new request to FR table and send email invite
  def create_request
    request = FriendRequest.create(params_create_request(params))
    if request.save
      # TODO: Send email invite
      render :json => {success: true, message: "new request created successfully"}
    else
      render :json => {success: false, errors: request.errors.full_messages.as_json}
    end
  end

  def resend_request
    render :json => {success: true, message: "request resend successfully"}
  end

  def delete_request
    render :json => {success: true, message: "request deleted successfully"}
  end

  private
  def params_create_request(params)
    params.permit(:email, :pin)
  end
end
