module Mail
  class Message

    #def html_part
      #find_first_mime_type('text/html')
    #end

    # Save the mail to seperate files when have several destination addresses
    # This function used to return a filename by mail's date and destination address
    def filename_for(to)
      "#{date.to_time.to_i}.#{to}.txt"
    end

  end
end
