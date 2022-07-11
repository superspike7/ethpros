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
end
