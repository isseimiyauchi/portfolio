class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_posts)
    if @post.save
      redirect_to posts_url
    else
      render new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def params_posts
    params.require(:post).permit(:title, :department_name, :article)
  end
end
