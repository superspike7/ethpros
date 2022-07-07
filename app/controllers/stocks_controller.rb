class StocksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    redirect_to home_path unless user_signed_in?

    @transactions = current_user.stock_transactions.includes(:stock)
  end
end
