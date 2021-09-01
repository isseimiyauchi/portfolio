class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :set_search

  def set_search
    @q = Post.ransack(params[:q])
    @search_posts = @q.result(distinct: true)
  end
end
