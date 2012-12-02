class PublicController < ApplicationController

  def register
    @user = User.new
    render "users/new"
  end

  def login_page
  end
end
