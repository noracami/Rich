class BlogsController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!, only: [:new]
  def index
    # flash[:notice] = 'test'
    @articles = Article.where(deleted_at: nil).order(id: :desc)
  end

  def new
    @article = Article.new
  end
end
