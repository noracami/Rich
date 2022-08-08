class BlogsController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!, only: [:new]
  def index
    @articles = Article.order(id: :desc)
  end

  def new
    @article = Article.new
  end
end
