MailsViewer::Engine.routes.draw do
  controller "home" do
    get "/index", :to => :index
    get "/raw", :to => :raw
    get "/html", :to => :html
    get '/attachment', :to => :attachment
  end
  root to: 'home#index'
end
