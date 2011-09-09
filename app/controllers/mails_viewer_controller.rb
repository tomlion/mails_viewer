class MailsViewerController < ApplicationController
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


private
  def mails_path
    File.join(Rails.root, "tmp", "mails")
  end

  def disabled_on_production
    if Rails.env == 'production' || Rails.application.config.action_mailer.delivery_method.to_sym != :file
      render :text => 'Mails Viewer is disabled' and return false 
    end
  end
end
