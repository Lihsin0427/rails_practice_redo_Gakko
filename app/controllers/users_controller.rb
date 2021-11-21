class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def account_verify
      redirect_to "/"
  end
end
