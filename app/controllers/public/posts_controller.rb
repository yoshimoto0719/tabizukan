class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.end_user_id = current_end_user.id
    @post.save
    redirect_to post_path
  end

  def index
  end

  private

  def post_params
    params.require(:post).permit(:location, :image, :description)
  end

end
