class BlogsController < ApplicationController
  def index
  end
  def new
  end
  def create
    # 寫入資料庫
    render html: params.class#[:content]
    # redirect_to blogs_path
    # render html: "已成功新增文章"
  end
end
