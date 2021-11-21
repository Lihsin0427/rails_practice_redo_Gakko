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

  private
  def users_params
    params.require(:user).permit(:username, :password, :email)
  end

end


