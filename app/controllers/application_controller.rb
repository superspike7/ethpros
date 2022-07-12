class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_index_path
    else current_user.user?
      if current_user.pending?
        users_approval_path
      else
        users_view_index_path
      end
    end
  end
  
  private
    def check_admin
      unless current_user.role == "admin"
        redirect_back fallback_location: root_path
      end
    end
end
