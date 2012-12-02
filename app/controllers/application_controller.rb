class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :auth_user_redirect #Descomentar cuando haya pagina de login
  #before_filter :session_test # Comentar cuando haya pagina de Login

  def session_test
    session[:user_id] = User.first.id
  end
  def auth_user_redirect
    redirect_to root_path if session[:user_id]
  end

  def login
    user = User.find_by_email(params[:email])
    if user
      session[:user_id] = user.id
      redirect_to tasks_cause_path(current_cause)
    else
      redirect_to login_page_path
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
  
  helper_method :current_cause

  def current_cause
    return nil if session[:cause_id].nil?
    cause = Cause.find(session[:cause_id])
    if cause
      return cause
    else
      return nil
    end
  end

end
