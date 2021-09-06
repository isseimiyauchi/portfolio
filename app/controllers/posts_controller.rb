class PostsController < ApplicationController
  before_action :set_search, only: [:index, :show, :search]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_posts)
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
  end

  private

  def params_posts
    params.require(:post).permit(:title, :from, :detail)
  end

  def set_search
    @q = Post.ransack(params[:q])
    @search_posts = @q.result(distinct: true)
  end
end
