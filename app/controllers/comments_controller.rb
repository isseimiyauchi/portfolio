class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:success] = "コメントを投稿しました。"
      redirect_back(fallback_location: post_path(post_id))
    else
      flash[:danger] = "コメントを投稿できませんでした。"
      redirect_back(fallback_location: post_path(post_id))
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
  end
end
