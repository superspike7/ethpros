class StocksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :check_user

  def index
    unless user_signed_in?
      redirect_to home_path 
    else
      @shares = current_user.shares.includes(:stock)
    end
  end
end
