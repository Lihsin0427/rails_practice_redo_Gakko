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
      render html: "ok"
    else
      render html: "no user"
    end
  end

  private
  def users_params
    params.require(:user).permit(:username, :password, :email)
  end

end


