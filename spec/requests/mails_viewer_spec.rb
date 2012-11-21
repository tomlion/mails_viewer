require 'spec_helper'

describe "MailsViewer" do
  before :all do
    @user = User.create(email: 'dingding@pragmatic.ly', name: 'Dingding Ye', login: 'dingding')
  end
  after :all do
    User.destroy_all
    delete_all_mails
  end

  it "should create a file under tmp/mails" do
    mail = UserMailer.welcome_email(@user).deliver
    has_mail_files?(mail).should == true
  end

  it "should create multi files under tmp/mails if the mail has serval 'to' address" do
    mail = UserMailer.multi_destinations_email(@user).deliver
    has_mail_files?(mail).should == true
  end

end
