class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :person_name, :gender, :phone_number])
      #devise_parameter_sanitizer.for(:sign_up)        << :user_name
      #devise_parameter_sanitizer.for(:account_update) << :user_name << :person_name << :gender << :phone_number
  end

  def authenticate_admin
      unless current_user.admin?
          flash[:alert] = "Not allow!"
          redirect_to root_path
      end
  end
end
