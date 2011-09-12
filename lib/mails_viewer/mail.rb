module Mail
  class Message

    def html_parts
      all_parts.select{|part| part.content_type =~ /text\/html/ }
    end

    def all_parts
      multipart? ? parts.inject([]){|messages, part| messages += part.all_parts } : [self]
    end

  end
end
