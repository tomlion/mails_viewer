require 'spec_helper'

describe MailsViewer::HomeController do
  render_views

  let(:mails_root) { File.join(Rails.root, "tmp", "mails") }
  let(:mail_files) { Dir.chdir(mails_root) { Dir['**/*'].select{|f| File.file?(f)} } }
  let(:mail_file) { mail_files.first }

  before :all do
    env = Rack::MockRequest.env_for("/?user[email]=a@b.com&user[name]=name&user[login]=login", "REQUEST_METHOD" => "POST")
    UsersController.action(:create).call(env)
  end
  after :all do
    User.destroy_all
  end

  describe "GET index" do
    it "should list all mails under tmp/mails" do
      get :index, use_route: :mails_viewer

      assigns(:mails).size.should == 1
      response.should be_success
    end

  end

  describe "GET raw" do
    it "should return mail raw data" do
      get :raw, filename: mail_file,  use_route: :mails_viewer
      response.body.should == File.read(File.join(mails_root, mail_file))
    end
  end

  describe "GET html" do
    let(:mail) { Mail.read(File.join(mails_root, mail_file)) }
    it "should return mail html part" do
      get :html, filename: mail_file, use_route: :mails_viewer
      response.body.to_s.should == mail.html_part.body.to_s
    end
  end

  describe "GET plain text" do
    let(:mail) { Mail.read(File.join(mails_root, mail_file)) }
    it "should return mail html part" do
      get :plain, filename: mail_file, use_route: :mails_viewer
      response.body.to_s.strip.should == "<pre>#{mail.text_part.body.to_s}</pre>"
    end
  end

  describe "disabled on production" do
    before :all do
      Rails.env = 'production'
    end
    after :all do
      Rails.env = 'test'
    end

    it "should return a disabled message when under production env" do
      get :html, use_route: :mails_viewer
      response.body.should == "Mails Viewer is disabled"
    end
  end

  describe "disabled when not deliveried by file" do
    before :all do
       Rails.application.config.action_mailer.delivery_method = :test
    end
    after :all do
       Rails.application.config.action_mailer.delivery_method = :file
    end

    it "should return a disabled message when mails not deliveried by file" do
      get :html, filename: 'abcd', use_route: :mails_viewer
      response.body.should == "Mails Viewer is disabled"
    end
  end

end

