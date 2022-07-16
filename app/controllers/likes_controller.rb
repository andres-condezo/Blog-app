class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = Like.new(author_id: current_user.id, post_id: post.id)

    if like.save
      flash[:success] = 'Liked'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to "/users/#{post.author.id}/posts/#{post.id}"
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
