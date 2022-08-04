class BlogsController < ApplicationController
  include UsersHelper
  def index
    # flash[:notice] = 'test'
    @articles = Article.all
  end

  def new
    if user_singed_in?
      @article = Article.new
    else
      redirect_to sign_in_users_path
    end
  end
end
