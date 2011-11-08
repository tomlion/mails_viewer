module MailsViewer
  module HomeHelper
    def email_path(filename, format = :raw)
      url_for(:controller => 'home', :action => format, :filename => filename)
    end
  end
end
