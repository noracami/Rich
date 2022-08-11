class PagesController < ApplicationController


  def home
    @blogs = Blog.all
  end

  def about
  end
end
