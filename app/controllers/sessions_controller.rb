class SessionsController < ApplicationController
  def create
    hashed_password = Digest::SHA1.hexdigest(salting(params[:user][:password]))
    user = User.find_by(
      email: params[:user][:email],
      password: hashed_password
    )

    if user
      redirect_to '/', notice: '成功'
    else
      redirect_to '/users/sign_in'
    end
  end
  private
  def salting(txt)
    "xx-------#{txt}--yy"
  end
end
