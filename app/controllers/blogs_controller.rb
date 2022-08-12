class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def show
    @blog = Blog.find_by!(handler: params[:handler])
    if user_singed_in? && @blog != current_user.blog
      BlogVisitor.find_by(user: current_user, blog: @blog)&.destroy
      @blog.visitors << current_user
    end
    @articles = @blog.user.articles
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.build_blog(blog_params)

    if @blog.save
      redirect_to "/@#{@blog.handler}", notice: "新增成功"
    else
      render :new
    end
  end

  def edit
    @blog = current_user.blog

  end

  def update
  end

  def destroy
  end

  private
    def blog_params
      params.require(:blog).permit(:handler, :title, :description)
    end
end
