class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    #attachments.inline['rails.png'] = File.read('/Users/i/workspace/mailer/app/assets/images/rails.png')
    mail(:to => user.email, :subject => 'Welcome to Example.com')
  end

  def multi_destinations_email(user)
    @user = user
    mail(:to => [user.email, 'youcai@intridea.com'], :subject => 'Hello world. CC: youcai')
  end
end
