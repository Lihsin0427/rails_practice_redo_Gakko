class ApplicationController < ActionController::Base
  include UsersHelper

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found  
    render file: 'public/404.html', layout: false, status: 404
  end
end
