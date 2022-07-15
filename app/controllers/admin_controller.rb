class AdminController < ApplicationController
  before_action :check_admin
  layout 'admin'
  
  def index
    @users = User.all
    @pending = User.where(pending: "waiting", role: 0)
    @newuser = User.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, role: 0)
  end

  def all
    @users = User.all.where(role: 0)
  end

  def transactions
  end

  def pending
    @users = User.all
    @pending = User.where(pending: "waiting", role: 0)
  end
end
