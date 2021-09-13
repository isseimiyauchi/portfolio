class PostsController < ApplicationController
  before_action :set_search, only: [:index, :show, :search]
  before_action :authenticate_user!, only: [:show, :create]

  def index
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_posts)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "記事を新規投稿しました。"
      redirect_to posts_url
    else
      flash[:danger] = "記事を投稿できませんでした。"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @comments = @post.comments
    @comment = current_user.comments.new
  end

  private

  def params_posts
    params.require(:post).permit(:title, :detail, :user_id, tag_ids: [])
  end

  def set_search
    @q = Post.ransack(params[:q])
    @search_posts = @q.result(distinct: true)
  end
end
