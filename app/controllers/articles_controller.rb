class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to "/"
    else
      render new_blog_path
    end
  end

  def show
    # Article.find(3)        # 只能查id, 查不到 > ActiveRecord::RecordNotFound
    # Article.find_by(id: 3) # 可查詢不同欄位, 查不到 > nil
    # render html: Article.where(id: 5).size
    # render html: Article.find_by!(id: params[:id]).title
    # begin
      # Error 錯誤
      # Exception 例外
      # @article = Article.find(params[:id])
    # rescue
      # redirect_to blogs_path
    # end
    # @article = Article.find_by!(id: params[:id])
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to blogs_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find_by!(id: params[:id])
  end
end
