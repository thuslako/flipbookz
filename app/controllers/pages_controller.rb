class PagesController < ApplicationController
  def index
     @title = "Home"
   end

   def create
     @title = "Contact"
      
      @message = Message.new(params[:message])

      if @message.valid?
          NotificationsMailer.new_message(@message).deliver
          redirect_to(root_path, :notice => "Message was successfully sent.")
      else
          flash.now.alert = "Please fill all fields."
          render 'new'
      end
  end

   def new
     @title = "About"
     @message = Message.new
   end
  
end
