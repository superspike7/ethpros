class StocksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    unless user_signed_in?
      redirect_to home_path 
    else
      @transactions = current_user.stock_transactions.includes(:stock)
    end
  end
end
