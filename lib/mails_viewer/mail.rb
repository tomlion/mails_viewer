module Mail
  class Message
    # Save the mail to seperate files when have several destination addresses
    # This function used to return a filename by mail's date and destination address
    def filename_for(to)
      "#{date.to_time.to_i}.#{to}.txt"
    end
  end
end
