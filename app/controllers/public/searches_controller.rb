class Public::SearchesController < ApplicationController
  before_action :authenticate_end_user!

  def search
    @posts = Post.search(params[:search])
  end
end
