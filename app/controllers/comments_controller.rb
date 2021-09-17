class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:success] = "コメントを投稿しました。"
    else
      flash[:danger] = "コメントを投稿できませんでした。"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
  end
end
