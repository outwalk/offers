class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, :set_i18n_locale_from_params
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end

    def authenticate_admin_user!
      authenticate_user!
      unless current_user.admin?
        flash[:alert] = "Unauthorized Access!"
        redirect_to edit_user_registration_path # redirect_to root_path
      end
    end

    def current_admin_user
      current_user if user_signed_in? && current_user.admin?
    end

    def configure_permitted_parameters
      profile_params = [:name, :phone_first, :phone_second, :phone_third, :phone_fourth, :terms_of_service, :subscribed, :slogan]
      devise_parameter_sanitizer.for(:sign_up).concat(profile_params)
      devise_parameter_sanitizer.for(:account_update).concat(profile_params)
    end
end
