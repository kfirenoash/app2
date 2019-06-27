class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:email, :password])
  	devise_parameter_sanitizer.permit(:sign_in,keys:[:name,:password])
  	devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email, :password])
  end
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def authenticete_user!
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end