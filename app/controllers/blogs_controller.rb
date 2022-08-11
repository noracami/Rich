class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def show
    @blog = Blog.find_by!(handler: params[:handler])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.build_blog(blog_params)

    if @blog.save
      redirect_to `/@#{@blog.handler}`, notice: '新增成功'
    else
      render :new
    end
  end

  def edit
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
