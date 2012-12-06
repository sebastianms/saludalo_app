class NetworksController < ApplicationController
  
  # GET /causes/:id/network
  def current
    @friends = Cause.find(params[:id]).users
    respond_to do |format|
      format.html { render "edit"}
      format.json { render json: @network }
    end
  end
  
  # POST /network/add_friend
  def add_friend
    
    email = params[:user][:email]
    
    friend = User.find_by_email(email)
    friend = User.new(:email =>email) if friend.nil?      
    friend.generate_invitation_token
    friend.causes << current_cause
    
    if friend.save
      UserMailer.invitation_email(current_user, friend, current_cause).deliver
    end
    
    respond_to do |format|
      format.json { render json: friend, status: friend.nil? ? 500 : 200 }
    end
  end
  
end
