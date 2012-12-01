class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :auth_user_redirect

  def auth_user_redirect
    redirect_to root_path if session[:user_id]
  end

  def login
    user = User.find_by_email(params[:email])
    if user
      session[:user_id] = user.id
    else
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  helper_method :current_user

  def current_user
    return nil if session[:user_id].nil?
    user = User.find(session[:user_id])
    if user
      return user
    else
      return nil
    end
  end

end
