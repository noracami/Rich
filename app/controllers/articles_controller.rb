# Authentication 認證
# Authorization 授權
class ArticlesController < ApplicationController
  before_action :authenticate_user!, expect: [:show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  # before_action :check_permittion, only: [:edit, :update, :destroy]

  def create
    # @article = Article.new(article_params)
    # @article.user = current_user
    @article = current_user.articles.new(article_params)

    if @article.save
      # flash[:notice] = 'ok'
      # redirect_to "/", notice: 'ok', alert: 'alert'
      redirect_to '/', notice: '文章新增成功'
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

  #TODO 2022 / 8 / 4
  def destroy
    # @article.destroy
    @article.update(deleted_at: Time.current)
    redirect_to blogs_path, notice: '文章刪除成功'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    # @article = Article.find_by!(id: params[:id])
    @article = current_user.articles.find_by!(id: params[:id])
  end

  # def check_permittion
  #   if not current_user.own?(@article)
  #     redirect_to root_path, notice: "權限不足"
  #   end
  #   # if @article.user != current_user
  #   #   redirect_to root_path, notice: "權限不足"
  #   # end
  # end
end
