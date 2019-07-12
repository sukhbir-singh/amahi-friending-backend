class FriendRequestsController < ApplicationController
  before_action :set_request, only: [:resend_request, :delete_request]

  def index
    friend_requests = FriendRequest.get_requests(@system_user.amahi_user_id)
    render :json => {success: true, data: friend_requests}
  end

  def create_request
    error, request = FriendRequest.create(params_create_request(params))
    if error
      render :json => {success: false, message: error}
    elsif request.save
      # TODO: Send email invite
      render :json => {success: true, message: "new request created successfully", request: request}
    else
      render :json => {success: false, errors: request.errors.full_messages.as_json}
    end
  end

  def resend_request
    unless @request.blank?
      if @request.amahi_user_id == @system_user.amahi_user_id
        @request.resend_request
        render :json => {success: true, message: "request resent successfully"}
      else
        render :json => {success: false, message: "not allowed"}
      end
    else
      render :json => {success: false, message: "request not found"}
    end
  end

  def delete_request
    unless @request.blank?
      if @request.amahi_user_id == @system_user.amahi_user_id
        @request.delete
        render :json => {success: true, message: "request deleted successfully"}
      else
        render :json => {success: false, message: "not allowed"}
      end
    else
      render :json => {success: false, message: "request not found"}
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
