class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_user, only: [:index, :approval]
  before_action :check_pending, only: [:index]
  layout 'admin', only: [:show, :edit, :update, :new, :create]

  def index
  end

  def approval
  end

  def show
  end

  def new 
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_all_path,  notice: 'The user has been created.'
    else
      render :new, alert: @user.errors.first.full_message
    end
  end

  def update
    if @user.update(pending: params[:pending])
      redirect_to admin_all_path, notice: 'The user has been updated.'
      if user_params.has_key(:pending)
        UserMailer.with(user: @user).approved_mail.deliver_later
      end
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:pending, :email, :password, :password_confirmation)
    end
end
