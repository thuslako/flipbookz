class SessionsController < ApplicationController
  
  skip_filter(:require_authentication)

  def index
    redirect_to(root_path)
  end
  
  def new
  end

  def create
    email, password = params[:user][:email], params[:user][:password]
    
    if user = User.authenticate(email, password)
      session[:user_id] = user.id
      redirect_to( feed_path, :notice => %Q[Welcome, #{user.first_name} #{user.last_name}])
    else
      flash.now.alert = 'Invalid email address or password'
      render('new') # render new.html.erb
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end
