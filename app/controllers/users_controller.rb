class UsersController < ApplicationController
  before_action :check_admin,  only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_user, only: [:index, :approval]

  def index
  end

  def approval
  end

  def show
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'The user has been updated.'
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:id, :email, :password, :created_at, :role, :pending)
    end
end
