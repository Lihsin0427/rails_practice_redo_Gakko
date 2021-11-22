module UsersHelper
  def user_signed_in?
    session[:welcome].present?
  end
end
