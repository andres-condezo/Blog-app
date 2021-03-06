class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(post_params)
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to user_post_path(params[:user_id], @comment.post_id)
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.decrement_comments_counter
    @comment.delete
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:comment).permit(:text)
  end
end
