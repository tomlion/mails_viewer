class UserMailer < ActionMailer::Base
  default from: "support@pragmatic.ly"

  def welcome_email(user)
    @user = user
    @url = 'http://pragmatic.ly/login'
    attachments.inline['favicon.ico'] = File.read(Rails.root.join("public/favicon.ico"))
    mail(to: user.email, subject: 'Welcome to Pragmatic.ly')
  end

  def multi_destinations_email(user)
    @user = user
    mail(to: [user.email, 'dingding@pragmatic.ly'], subject: 'Hello world. CC: dingding')
  end
end
