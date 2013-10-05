class PostsController < ApplicationController
  
  before_filter(:require_authentication, :only => [:feed,:create,:edit])
  
  def index
    @post = Post.all(:order => "created_at DESC")
    
  end
  
  def feed
    @post = Post.all
    
  end
  
  def create
    @post = Post.create(params[:post])
    
    if @post.save
      redirect_to root_path
    end
  end
  
  def edit
     @post= Post.find(params[:id])
  end
  
  def show
     @post = Post.find(params[:id])
  end
  
  def destroy 
    @post = Post.find(params[:id])
    @post.delete
    respond_to do |format|
      format.html{redirect_to root_path,  notice: 'Post was successfully updated.' }
      format.json { head :no_content }
    end
  end
  
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
