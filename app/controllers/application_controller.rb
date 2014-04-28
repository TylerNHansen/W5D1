class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #private

  helper_method :signed_in?, :sign_in, :sign_out, :current_user

  def current_user
    return nil unless session[:token]
    @current_user = User.find_by_token(session[:token])
  end

  def sign_in
    @user.reset_token!
    session[:token] = @user.token
  end

  def sign_out
    current_user.reset_token!
    session[:token] = nil
  end

  def signed_in?
    !!current_user
  end

end
