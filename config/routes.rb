MailsViewer::Engine.routes.draw do
  controller "home" do
    match "/", :to => :index
    get "/raw", :to => :raw
  end
end
