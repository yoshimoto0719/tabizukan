class Public::PostsController < ApplicationController
  before_action :authenticate_end_user!, only: [:mypost]

  def new
    @post = Post.new
    @end_user = current_end_user
  end

  def create
    @post = Post.new(post_params)
    @post.end_user = current_end_user
    @post.save
    redirect_to mypost_path(@post.id)
  end

  def show
    @post = Post.find(params[:id])
    @end_user = @post.end_user
    @comment = Comment.new
    @comments = @post.comments
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
    @end_user = current_end_user
  end

  private

  def post_params
    params.require(:post).permit(:location, :cost, :day1, :day2, :image, :description, :tag_ids)
  end

end
