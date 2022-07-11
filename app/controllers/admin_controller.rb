class AdminController < ApplicationController
  before_action :check_admin
  layout 'admin'
  
  def index
    @users = User.all
    @pending = User.where(pending: "waiting")
    @newuser = User.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  def all
    @users = User.all
  end

  def transactions
  end

  def pending
    @users = User.all
    @pending = User.where(pending: "waiting")
  end
  
  private
    def check_admin
      unless current_user.role == "admin"
        redirect_back fallback_location: root_path
      end
    end
end
