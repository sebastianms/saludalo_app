class ApplicationController < ActionController::Base
  protect_from_forgery

  def login
    user = User.find_by_email(params[:email])
    if user
      session[:user_id] = user.id
    else
      redirect_to root_path
    end
  end

end
