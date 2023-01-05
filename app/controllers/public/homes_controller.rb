class Public::HomesController < ApplicationController

  def top
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @end_user = EndUser.find(params[:id])
  end

end
