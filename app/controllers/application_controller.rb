class ApplicationController < ActionController::Base
  include UsersHelper

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  helper_method :user_signed_in?, :current_user

  private
  def record_not_found  
    render file: 'public/404.html', layout: false, status: 404
  end

  def user_signed_in?
    session[:welcome].present?
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:welcome])
  end

end
