MailsViewer::Engine.routes.draw do
  controller "mails_viewer" do
    match "/", :to => :index
    get "/raw", :to => :raw
  end
end
