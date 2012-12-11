class UserMailer < ActionMailer::Base
  default from: "losinsaciables2012@gmail.com"

  #layout 'layout' # use awesome.(html|text).erb as the layout

  def welcome_email(user)
    @user = user
    email_with_name = "#{@user.name} <#{@user.email}>"
    @url  = "http://mejoramigo.herokuapp.com/login"
    mail(:to => user.email, :subject => "Bienvenido a MejorAmigo")
  end

  def invitation_email(host,guest,cause)
    @host = host
    @guest = guest
    @cause = cause
    @url  = "http://mejoramigo.herokuapp.com/?invitation_token=#{guest.invitation_token}"
    mail(:to => guest.email, :subject => "[MejorAmigo] #{cause.affected_name} necesita tu ayuda!")
  end  
end
