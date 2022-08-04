module UsersHelper
  def current_user
    User.find_by(id: session[:user_session])
  end

  def user_singed_in?
    session[:user_session] && current_user
  end
end
