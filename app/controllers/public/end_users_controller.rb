class Public::EndUsersController < ApplicationController

  before_action :authenticate_end_user!, only: [:favorites]
  before_action :set_end_user, only: [:favorites]

  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_users_params)
      flash[:notice] = "会員情報を変更しました"
      redirect_to end_users_my_page_path
    else
      render :edit
    end
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(is_deleted: true)
    reset_session
    redirect_to root_path, alert: "退会しました"
  end

  def favorites
    favorites = Favorite.where(end_user_id: @end_user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @end_user = EndUser.find(params[:id])
  end

  private

  def end_users_params
    params.require(:end_user).permit(
      :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :email)
  end

  def set_end_user
    @end_user = EndUser.find(params[:id])
  end

end
