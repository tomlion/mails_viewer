MailsViewer::Engine.routes.draw do
  controller "home" do
    get "/index", :to => :index
    get "/raw", :to => :raw
    get "/html", :to => :html
  end
  root to: 'home#index'
end
