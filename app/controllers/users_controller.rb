class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      # flash[:notice] = 'add user ok'
      redirect_to '/', notice: '註冊成功'
    else
      render :sign_up, data: {notice: @user.errors}
    end
  end
  def sign_in
    @user = User.new
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation)
  end
end
