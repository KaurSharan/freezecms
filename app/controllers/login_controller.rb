class LoginController < ApplicationController
  def form
  end

  def authenticate
  	email = params[:user][:email]
  	password = params[:user][:password]
  	@user = User.authenticate_user(email,password)
	if @user
		session[:first_name] = @user.UserDetail  ? @user.UserDetail.first_name : " ";
		session[:email] = @user.email
		session[:id] = @user.id
		if @user.is_admin 
			redirect_to :controller=>"user",:action=>'view'
		else
			redirect_to :controller=>"login",:action=>'form'
		end		
	else
		redirect_to :controller=>"login",:action=>'form'
  	end 
  end
  def logout
  		session[:email] = nil
		session[:id] = nil
		session[:first_name] = nil
		@nil= 'nill ho gaya aa'
		redirect_to :controller=>'public',:action=>'view'
  end

  # def check
  # 	pass = params[:password1]
  # 	@u = User.find_by_email(params[:name]
	 #   	if @u && @u.password == password1 
	 #   		# && @u.is_admin == "1"
	 #  		session[:name] = @u.email
	 #  		session[:id] =@u.id
	 #  		redirect_to '/user/user'
	 #  	else
	 #  		render 'form'
	 #  	end
  # end

end
