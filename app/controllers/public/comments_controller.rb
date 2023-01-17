class Public::CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_end_user!

def create
  @comment = @post.comments.create(comment_params)
  if @comment.save
    redirect_to root_path(@post), notice: 'コメントしました'
  else
    flash.now[:alert] = 'コメントに失敗しました'
    render post_path(@post)
  end
end

def destroy
  @comment = Comment.find(params[:id])
  if @comment.destroy
    redirect_to post_path(@post), notice: 'コメントを削除しました'
  else
    flash.now[:alert] = 'コメント削除に失敗しました'
    render post_path(@post)
  end
end

def index
  @comment = Comment.all
end

private
def set_post
  @post = Post.find(params[:post_id])
end

def comment_params
  params.required(:comment).permit(:comment_text).merge(end_user_id: current_end_user.id, post_id: params[:post_id])
end
end
