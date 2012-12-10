class PublicController < ApplicationController

  def register
    @user = User.new
    if current_user
      redirect_to current_user_causes_path(current_user.id)
    else
      render "users/new"
    end
  end

  def login_page
  end

  def delete_session
    reset_session
    redirect_to(:back)
  end
end
