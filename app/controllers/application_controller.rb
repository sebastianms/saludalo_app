class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_invitation_parameter_on_request
  
  def check_invitation_parameter_on_request
    unless params[:invitation_token].nil?
      user = User.find_by_invitation_token(params[:invitation_token])
      unless user.nil?
        set_logged_user user
        redirect_to edit_user_path(user)
      end
    end
  end

  # LOGIN methods
  def login
    user = User.find_by_email(params[:email])
    if user
      set_logged_user user
      redirect_to tasks_cause_path(current_cause)
    else
      redirect_to login_page_path
    end
  end

  def logout
    session[:user_id] = nil
    session[:cause_id] = nil
    redirect_to root_path
  end
  
  def auth_user_redirect
    redirect_to root_path if session[:user_id]
  end

  helper_method :current_user

  def current_user
    begin
      return nil if session[:user_id].nil?
      user = User.find(session[:user_id])
      return user
    rescue Exception => e
      return nil
    end
  end

  helper_method :current_cause

  def current_cause
    user = current_user
    unless user.nil?
      if session[:cause_id].nil?
        session[:cause_id] = user.causes.first.id
      end
      cause = Cause.find(session[:cause_id])
      if cause
        return cause
      else
        return nil
      end
    end
  end
  
  private
  
  def set_logged_user user
    session[:user_id] = user.id
  end
  
end
