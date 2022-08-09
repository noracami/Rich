class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: [:create]
  before_action :find_comment, only: [:destroy]

  def create
    @comment = @article.comments.new(comment_params)

    if @comment.save
      redirect_to @article, notice: "success"
    else
      redirect_to @article, notice: "fail"
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.article, notice: "delete comment success"
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end

  def find_article
    @article = Article.find_by!(id: params[:article_id])
  end

  def find_comment
    @comment = current_user.comments.find(params[:id])
  end
end
