class PublicController < ApplicationController

  def register
    @user = User.new
    render "users/new"
  end

  def index
  end
end
