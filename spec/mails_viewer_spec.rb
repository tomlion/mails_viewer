require 'spec_helper'

describe "MailsViewer" do
  before do
    @user = double(:user)
    @user.stub(:name) { 'name' }
    @user.stub(:login) { 'login' }
    @user.stub(:email) { 'test@intridea.com' }
    @mail = UserMailer.welcome_email(@user).deliver
  end

  it "should haha" do
    p MailsViewer
  end
end
