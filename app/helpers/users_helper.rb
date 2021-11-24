module UsersHelper
  def user_signed_in?
    session[:welcome].present?
  end
  def current_user
    User.find(session[:welcome])
  end
end
