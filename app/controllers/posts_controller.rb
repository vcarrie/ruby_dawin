class PostsController < ApplicationController

  before_action :load_post, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!, only: [:show, :update, :edit, :destroy]

  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(post_params)
    @post.user = @user
    @post.date_post = Time.now
    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      render "new"
    end
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def show
    @user = User.find(params[:user_id])
    if @user != @post.user
      redirect_to user_post_path(@user)
    end
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def update

    @user = User.find(params[:user_id])
    @post.update_attributes(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      render "show"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post.destroy
    redirect_to users_path
  end

  private


  def post_params
    params.require(:post).permit(:image, :body, :chapeau, :chapeau, :title)
  end

  def load_post
    @post = Post.find(params[:id])
  end

end