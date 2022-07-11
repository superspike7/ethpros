class StocksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    unless user_signed_in?
      redirect_to home_path 
    else
      @stocks = current_user.stocks
    end
  end
end
