class AdminController < ApplicationController
  layout 'admin'
  
  def index
    @users = User.all
    @pending = User.where(pending: "waiting")
    @newuser = User.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  def new
  end

  def create
  end

  def update
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

end
