class Public::PostsController < ApplicationController
  before_action :authenticate_end_user!, only: [:mypost]

  def new
    @post = Post.new
    @end_user = current_end_user
  end

  def create
    tag_id = params[:post][:tag_id]
    @post = Post.new(post_params)
    @post.end_user = current_end_user
    if @post.save
      PostTag.create(post_id: @post.id, tag_id: tag_id)
      redirect_to mypost_path(@post.id)
    else
      render :new
    end
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
    if params[:search]
      @posts = Post.search(params[:search])
    else
      @posts = Post.tag_search(params[:tag_id])
    end
  end

  def mypost
    @posts = current_end_user.posts.order(created_at: :DESC)
    @end_user = current_end_user
  end

  private

  def post_params
    params.require(:post).permit(:location, :cost, :day1, :day2, :image, :description)
  end

end
