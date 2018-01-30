class CommentsController < ApplicationController

  def index

  end

  def create
    @comment = Comment.new(comments_params)
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment.user = @user
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post)
    else
      render "new"
    end
  end


  def comments_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end

end