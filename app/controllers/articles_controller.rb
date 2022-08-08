class ArticlesController < ApplicationController
  before_action :authenticate_user!, expect: [:show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to '/', notice: '文章新增成功'
    else
      render new_blog_path
    end
  end

  def show
    @article = Article.find_by!(id: params[:id])
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to blogs_path, notice: '文章修改成功'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to blogs_path, notice: '文章刪除成功'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :pincode)
  end

  def find_article
    @article = current_user.articles.find_by!(id: params[:id])
  end
end
