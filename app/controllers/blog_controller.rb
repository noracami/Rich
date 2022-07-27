class BlogController < ApplicationController
  def index
  end
  def new
  end
  def create
    # 寫入資料庫
    redirect_to "/blog"
    # render html: "已成功新增文章"
  end
end
