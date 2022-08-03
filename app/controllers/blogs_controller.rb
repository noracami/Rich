class BlogsController < ApplicationController
  def index
    # flash[:notice] = 'test'
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
end
