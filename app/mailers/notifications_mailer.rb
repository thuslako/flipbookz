class NotificationsMailer < ActionMailer::Base
    default :from => "noreply@lukundu.net"
    default :to => "lukundu.lako@gmail.com"

    def new_message(message)
      @message = message
      mail(:subject => "[Lukundu.net] #{message.subject}")
    end
    def auto_reply()
      
      @reply= reply 
      mail(:subject => '[Lukundu.net]-Thanks for email',to=> #{reply.email})

    end
end
