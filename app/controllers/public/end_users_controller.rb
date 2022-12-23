class Public::EndUsersController < ApplicationController

  def show
    @end_user = current_end_user
  end

  def edit
  end

  def end_users_params
    params.require(:end_user).permit(
      :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :email)
  end

end
