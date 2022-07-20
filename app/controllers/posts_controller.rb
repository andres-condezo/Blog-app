class PostsController < ApplicationController
  def index
    @page = params.fetch(:page, 0).to_i
    @page = 0 if @page.negative? || @page > (Post.count / 2)
    @user = current_user
    @user_posts = Post.includes(comments: [:author]).where(author_id: @user.id).offset(@page * 2).limit(2)
  end

  def show
    @user = current_user
    @current_post = Post.includes(comments: [:author]).where(author_id: @user.id).find(params[:id])
    @current_user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

