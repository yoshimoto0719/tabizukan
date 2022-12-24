class Public::EndUsersController < ApplicationController

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

  def end_users_params
    params.require(:end_user).permit(
      :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :email)
  end

end
