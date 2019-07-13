Rails.application.routes.draw do
    # friend user APIs
    get "frnd/users" => "friend_users#index"
    delete "frnd/user/:id" => "friend_users#delete_user"

    # friend request APIs
    get "frnd/requests" => "friend_requests#index"
    delete "frnd/request/:id" => "friend_requests#delete_request"
    post "frnd/request" => "friend_requests#create_request"
    put "frnd/request/:id/resend" => "friend_requests#resend_request"
end
