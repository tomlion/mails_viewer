MailsViewer::Engine.routes.draw do
  controller "home" do
    match "/", :to => :index
    get "/raw", :to => :raw
    get "/html", :to => :html
  end
end
