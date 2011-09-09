Mail::FileDelivery.class_eval do
    def deliver!(mail)
      if ::File.respond_to?(:makedirs)
        ::File.makedirs settings[:location]
      else
        ::FileUtils.mkdir_p settings[:location]
      end

      mail.destinations.uniq.each do |to|
        ::File.open(::File.join(settings[:location], "#{Time.new.to_f}.#{to}.eml"), 'a') { |f| "#{f.write(mail.encoded)}\r\n\r\n" }
      end
    end
end
