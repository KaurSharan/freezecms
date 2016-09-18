class PublicController < ApplicationController
include ApplicationHelper  
layout 'front' 
  def view
    if session[:email]
      @uid= session[:id]
      @detail=Userdetail.find_by_user_id(@uid)
      
    end
  end
    def blog
      # @users=User.all
      @blogs=Blog.order(created_at: :desc)
       render :layout=>'fron'
    end
  
  def login
  	render :layout=>'fron'	
  end
   def signup
  	render :layout=>'fron'
  		
  end
  def create_user

    @user = User.new()
    # print params[:email]
    @user.email = params[:create][:email]  
    @user.password = params[:create][:password]
    @user.is_admin = 0
    @user.is_active = 1
    if @user.valid?
      @user.save
      session[:email] = @user.email
      session[:id] = @user.id
      redirect_to :action=>"detail"  
      else
        @object = @user.errors.full_messages
        render 'signup'
      end
  end
    def detail                                 
      render :layout=>'fron'
    end
    def data
        
        photo = upload(params[:det][:profile_pic])
        if photo
          params[:det][:profile_pic]=photo
          @us = Userdetail.new(detail_params)
   
      @us.valid?
      if @us.save
        @msg = "User Saved Successfully"
        redirect_to :controller=>"public",:action=>'login'     
      else
        @object=@us.errors.full_messages
       render 'detail'
      end

  end
  end
  def detail_params
  params.require(:det).permit(:user_id,:first_name,:last_name,:profile_pic,:number)    
  end
      def check
    dp
    @us = Feedback.new(feedback_params)
    @us.valid?
    if @us.save
      @msg = "User Saved Successfully"
     render 'view'
    else
      @object=@us.errors.full_messages
     render 'view'
    end
  end
  def feedback_params
  return params.require(:feed).permit(:name,:email,:comment)    
  end


    def authenticate
  	email = params[:user][:email]
  	password = params[:user][:password]
  	@user = User.authenticate_user(email,password)
	if @user
		session[:first_name] = @user.Userdetail.first_name
		session[:email] = @user.email
		session[:id] = @user.id
    session[:is_admin] = @user.is_admin
		if @user.is_admin 
			redirect_to :controller=>"user",:action=>'view'
      else
          	redirect_to :controller=>"select",:action=>'select'    
     end
     	
	else

		redirect_to :controller=>"public",:action=>'login'
  	end      
end
  def logout
  		session[:email] = nil
		session[:id] = nil
		session[:first_name] = nil
		redirect_to :action=>'view'
  end     

end
