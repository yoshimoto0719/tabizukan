class Public::CommentsController < ApplicationController
  before_action :authenticate_end_user!

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.end_user_id = current_end_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
