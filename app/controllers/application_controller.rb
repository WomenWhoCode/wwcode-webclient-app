class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate_admin!
    if !current_user || !current_user.role.admin?
      flash[:danger] = "Error: adminstrator permission required for this url."
      redirect_to '/events'
    end
  end
end
