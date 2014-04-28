class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.reset_token!

    if @user.save
      sign_in
      redirect_to root_path
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to root_path
    end

  end

  def new
    @user = User.new
  end

  def edit

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
