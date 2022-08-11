class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [ :new, :show, :unlock]
  before_action :find_current_user_article, only: [:edit, :update, :destroy]
  before_action :find_article, only: [:show, :unlock]

  def index
    @articles = Article.order(id: :desc)
    flash[:notice] = 123
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to '/', notice: '文章新增成功'
    else
      render new_blog_path
    end
  end

  def show
    @comment = Comment.new
    @comments = @article.comments.order(id: :desc)
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

  def unlock
    if @article.pincode == params[:pincode]
      set_unlock_article(@article.id)
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article), notice: "pincode error!!"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :pincode)
  end

  def find_current_user_article
    @article = current_user.articles.find_by!(id: params[:id])
  end

  def find_article
    @article = Article.find_by!(id: params[:id])
  end

  def set_unlock_article(article_id)
    if session[:unlock_articles]
      session[:unlock_articles] << article_id
      session[:unlock_articles].uniq!
    else
      session[:unlock_articles] = [article_id]
    end
  end
end
