class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  rescue_from Pundit::NotAuthorizedError, with: :no_permission

  helper_method :current_user, :user_singed_in?

  private

  def record_not_found
    render status: 404, layout: false, file: "#{Rails.root}/public/404.html"
    # redirect_to blogs_path
  end

  def no_permission
    redirect_to root_path, notice: "權限不足"
  end

  # Memorization
  def current_user
    @_current_user ||= User.find_by(id: session[:user_session])
  end

  def user_singed_in?
    session[:user_session] && current_user
  end

  def authenticate_user!
    redirect_to sign_in_users_path unless user_singed_in?
  end
end
