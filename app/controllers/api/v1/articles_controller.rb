class Api::V1::ArticlesController < ApplicationController
  before_action :authenticate_user!

  def like
    article = Article.find(params[:article_id])

    if current_user.liked?(article)
      current_user.liked_articles.destroy(article)
      render json: { state: "like", id: params[:article_id] }
    else
      current_user.liked_articles << article
      render json: { state: "unlike", id: params[:article_id]}
    end
  end
end
