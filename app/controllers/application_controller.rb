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
    def check_user
      unless current_user.role == "user"
        redirect_back fallback_location: admin_index_path
      end
    end
    def check_pending
      unless current_user.pending == "approved"
        redirect_to users_approval_path
      end
    end
end
