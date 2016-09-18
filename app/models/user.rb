class User < ActiveRecord::Base
	has_one :Userdetail
	has_one :proname
	has_many :blog
 
	validates_presence_of :email, :password
	# validates_email_realness_of :email
	validates_uniqueness_of :email
	validates_format_of :email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates_length_of :password, minimum: 6 

	def self.authenticate_user(email,password)
    	@user = User.find_by_email(email)
		if @user && @user.password == password
			return @user
		else
			return false
	  	end 
    end
end
