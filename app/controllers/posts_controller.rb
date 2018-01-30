class PostsController < ApplicationController

  before_action :load_post, only: [:show, :update, :edit, :destroy]


  def index
    @posts = Post.all.order(date_post: :desc)
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user = @user
    @post.date_post = Time.now
    if @post.save
      redirect_to posts_path
    else
      render "new"
    end
  end

  def new
    @post = Post.new
  end

  def show
    @comments = Comment.where(:post_id => @post)
    @comment = Comment.new
  end

  def edit
  end

  def update

    @post.update_attributes(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render "show"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private


  def post_params
    params.require(:post).permit(:image, :body, :chapeau, :chapeau, :title)
  end

  def load_post
    @post = Post.find(params[:id])
  end

end