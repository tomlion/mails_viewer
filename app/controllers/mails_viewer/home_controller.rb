module MailsViewer
  class HomeController < ActionController::Base
    layout false
    before_filter :disabled_on_production

    def index
      @files = Dir[mails_path+"/**/*"].select{|f| File.file?(f)}
      @mails = @files.inject([]) do |mails, f|
        mails << Mail.read(File.join(f)) 
      end
    end

    def raw
      render text: File.read(params[:filename])
    end

    def html
      mail = Mail.read(params[:filename])
      render text: mail.html_part.body
    end


  private
    def mails_path
      path = Rails.application.config.action_mailer.file_settings.try(:[], :location) || './tmp/mails'
      path = File.join(Rails.root, path) unless path.start_with?('/')
      path
    end

    def disabled_on_production
      if Rails.env == 'production' || Rails.application.config.action_mailer.delivery_method.to_sym != :file
        render :text => 'Mails Viewer is disabled' and return false 
      end
    end

  end
end
