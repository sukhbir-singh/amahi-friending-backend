class FriendRequestsController < ApplicationController
  before_action :set_request, only: [:resend_request, :delete_request]

  def index
    render :json => {success: true, data: FriendRequest.all.as_json}
  end

  def create_request
    request = FriendRequest.create(params_create_request(params))
    if request.save
      # TODO: Send email invite
      render :json => {success: true, message: "new request created successfully", request: request}
    else
      render :json => {success: false, errors: request.errors.full_messages.as_json}
    end
  end

  def resend_request
    unless @request.blank?
      @request.resend_request
      render :json => {success: true, message: "request resent successfully"}
    else
      render :json => {success: false, message: "request not found with provided id"}
    end
  end

  def delete_request
    unless @request.blank?
      @request.delete
      render :json => {success: true, message: "request deleted successfully"}
    else
      render :json => {success: false, message: "request not found with provided id"}
    end
  end

  private
  def params_create_request(params)
    params.permit(:email, :pin)
  end

  def set_request
    @request = FriendRequest.find(params[:id]) rescue nil
  end
end
