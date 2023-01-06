class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.end_user = current_end_user
    @post.save
    redirect_to mypost_path(@post.id)
  end

  def show
    @post = Post.find(params[:id])
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/'
  end

  def search
    @posts = Post.search(params[:search])
  end

  def mypost
    @posts = current_end_user.posts
  end

  private

  def post_params
    params.require(:post).permit(:location, :cost, :day1, :day2, :image, :description)
  end

end
