class SessionsController < ApplicationController
  def create
    # user = User.login(**params.require(:user)
    #                           .permit(:email, :password)
    #                           .to_h
    #                           .symbolize_keys)
    user = User.login(params)
    if user
      # 發號碼牌 發 session
      session[:user_session] = user.id

      # 檢查是否已經有部落格
      if user.blog.presence?
        redirect_to root_path, notice: '登入成功'
      else
        redirect_to new_blog_path, notice: '請先建立部落格'
      end
    else
      redirect_to '/users/sign_in', notice: '登入失敗'
    end
  end
  def destroy
    redirect_to root_path, notice: '登出成功'
  end
end
