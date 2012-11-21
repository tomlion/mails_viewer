module MailsViewer
  class HomeController < ActionController::Base
    layout false
    before_filter :disabled_on_production
    before_filter :find_absolute_filename, only: [:raw, :html, :attachment, :plain]

    def index
      Dir.chdir(mails_path) do
        @mails = Dir["**/*"]
          .select{|f| File.file?(f)}
          .map{|f| [Mail.read(f), f]}
      end
    end

    def raw
      if @filename
        render text: File.read(@filename)
      else
        head :not_found
      end
    end

    def html
      if @filename
        mail = Mail.read(@filename)
        body = mail.html_part ? mail.html_part.body : mail.body
        render text: body
      else
        head :not_found
      end
    end

    def plain
      if @filename
        mail = Mail.read(@filename)
        @body = mail.text_part ? mail.text_part.body.to_s : mail.body.to_s
      else
        head :not_found
      end
    end

    def attachment
      if @filename
        mail = Mail.read(@filename)
        attachment = mail.attachments[params[:attachment]]

        if attachment
          send_data attachment.body.decoded, filename: params[:attachment], type: attachment.content_type and return
        end
      end

      head :not_found
    end

  private
    def mails_path
      @mails_path ||= File.expand_path(Rails.application.config.action_mailer.file_settings.try(:[], :location) || './tmp/mails',
                                       Rails.root)
    end

    def disabled_on_production
      if Rails.env == 'production' || Rails.application.config.action_mailer.delivery_method.to_sym != :file
        render text: 'Mails Viewer is disabled' and return false
      end
    end

    def find_absolute_filename
      if params[:filename].present?
        filename = File.expand_path(params[:filename], mails_path)

        # ensure the file is in mails_path
        if filename == File.join(mails_path, params[:filename])
          @filename = filename
        end
      end
    end

  end
end
