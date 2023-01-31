class Admin::CommentsController < ApplicationController
def destroy
  @comment = Comment.find(params[:id])
  if @comment.destroy
    redirect_to comments_admin_end_user_path(params[:end_user_id]), notice: 'コメントを削除しました'
  else
    flash.now[:alert] = 'コメント削除に失敗しました'
    render comments_admin_end_user_path(params[:end_user_id])
  end
end
end
