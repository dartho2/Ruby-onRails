class Admin::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  before_action :is_admin?, only: [:new, :create]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :zip, :city, :nip, :phone, :fullname, :street])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :zip, :city, :nip, :phone, :fullname, :street])
  end

  def is_admin?
    if admin_signed_in? # if user signed
      if current_admin.admin? # if adminstrator return true
        true
      else
        redirect_to some_path
      end
    else
      redirect_to admin_session_path
    end
  end
end
