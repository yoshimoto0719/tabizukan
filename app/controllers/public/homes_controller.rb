class Public::HomesController < ApplicationController
  before_action :authenticate_end_user!

  def top
    @posts = Post.all
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all.order(created_at: :DESC)
    @end_user = current_end_user
  end

  def show
    @post = Post.find(params[:id])
    @end_user = EndUser.find(params[:id])
  end

end
