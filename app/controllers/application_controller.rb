class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render status: 404, layout: false, file: "#{Rails.root}/public/404.html"
    # redirect_to blogs_path
  end
end
