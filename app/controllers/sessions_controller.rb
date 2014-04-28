class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    .try(:authenticate, params[:user][:password])

    if @user
      sign_in
      redirect_to root_path
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end