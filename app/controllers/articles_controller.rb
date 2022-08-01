class ArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

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
    # render html: Article.find_by!(params[:id]).title
    # begin
      # Error 錯誤
      # Exception 例外
      # @article = Article.find(params[:id])
    # rescue
      # redirect_to blogs_path
    # end
    @article = Article.find_by!(id: params[:id])
  end

  def edit
    @article = Article.find_by!(id: params[:id])
  end

  def update
    @article = Article.find_by!(id: params[:id])

    if @article.update(article_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find_by!(id: params[:id])
    @article.destroy
    redirect_to blogs_path
  end

  def record_not_found
    redirect_to blogs_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
