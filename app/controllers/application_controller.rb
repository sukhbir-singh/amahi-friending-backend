class ApplicationController < ActionController::API
    before_action :check_authentication

    def check_authentication
        @system_user = System.where(api_key: request.headers["api-key"]).first
        if @system_user.blank?
            return render :json => {success: false, message: "authetication failed"}
        end
    end

end
