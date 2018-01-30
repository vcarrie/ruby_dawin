class UsersController < ApplicationController
  before_action :load_user, only: [:show, :update, :edit, :destroy]
  before_action :load_Post, only: [:show, :update, :edit, :destroy]



  def index
    @users = User.all
    if user_signed_in?
      @user = current_user
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path(@user)
    else
      render "new"
    end
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
    if @user.save
      redirect_to users_path(@user)
    else
      render "show"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def load_user
    @user = User.find(params[:id])
  end

  def load_Post
    @post = Post.find(params[:post_id])
  end
end