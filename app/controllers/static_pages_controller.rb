class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'devise'

  def home
  end
end
