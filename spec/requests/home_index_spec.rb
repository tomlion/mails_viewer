require 'spec_helper'

describe "List all mails" do
  before :all do
    @user = User.create(email: 'dingding@pragmatic.ly', name: 'Dingding Ye', login: 'dingding')
  end

  after :all do
    User.destroy_all
    delete_all_mails
  end

  before do
    visit "/mails"
  end

  it "should list all  the mails" do
    page.should have_css("tr.mail")
    page.should have_css("tr.mail .raw")
    page.should have_css("tr.mail .html")
    page.should have_css("tr.mail .attachment")
    page.should have_css("tr.mail .plain")
  end
end
