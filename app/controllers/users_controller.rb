class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def account_verify
    
    @user = User.new(users_params)

    if @user.save
      redirect_to "/"
    else
      render :sign_up
    end
  end

  def sign_in
    @user = User.new
  end

  def check
    u = User.login(params[:user])
    if u
      session[:welcome] = u.id
      redirect_to "/"
    else
      render html: "no user"
    end
  end

  def sign_out
    session[:welcome] = nil
    redirect_to courses_path, notice: '已登出'
  end

  private
  def users_params
    params.require(:user).permit(:username, :password, :email)
  end

end


