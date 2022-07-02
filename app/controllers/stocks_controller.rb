class StocksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    redirect_to home_path unless user_signed_in?
  end
end
