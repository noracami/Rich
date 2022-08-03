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

      redirect_to '/', notice: '成功'
    else
      redirect_to '/users/sign_in', notice: '失敗'
    end
  end
end
