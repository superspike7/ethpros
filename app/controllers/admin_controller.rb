class AdminController < ApplicationController
  layout 'admin'
  
  def index
    @users = User.all
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
  end

end
