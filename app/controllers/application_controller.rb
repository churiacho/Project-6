class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,
            keys: [:username, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar])
        devise_parameter_sanitizer.permit(:sign_in, 
            keys: [:email, :password, :remember_me])
        devise_parameter_sanitizer.permit(:account_update,
            keys: [:username, :first_name, :last_name, :email, :password_confirmation, :current_password])
        update_attrs = [:password, :password_confirmation, :current_password, :age, :bio, :avatar, :avatar_cache, :remove_avatar]
        devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)
    end

    # include UsersHelper

end
