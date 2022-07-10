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
    render :action => 'all'
  end
  
  def pending
  end
  
  def transactions
  end
end
