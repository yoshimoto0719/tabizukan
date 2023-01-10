class Public::HomesController < ApplicationController

  def top
    @posts = Post.all
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
    @end_user = current_end_user
  end

  def show
    @post = Post.find(params[:id])
    @end_user = EndUser.find(params[:id])
  end

end
