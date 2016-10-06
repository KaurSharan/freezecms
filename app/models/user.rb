class User < ActiveRecord::Base
	require 'digest/sha1'
	before_save :do_hashing
	has_one :Userdetail
	has_one :proname
	has_many :blog
	paginates_per 5
 
	validates_presence_of :email, :password
	# validates_email_realness_of :email
	validates_uniqueness_of :email
	validates_format_of :email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates_length_of :password, minimum: 6 

	def hash_password(password)
	 		return Digest::SHA1.hexdigest(password)
	 	end

	 	def do_hashing
	 		self.password = hash_password(self.password)
	 	end

	 def self.authenticate_user(email,password)
    	@user = User.find_by_email(email)
		if @user && @user.password ==  self.new.hash_password(password)
			return @user
		else
			return false
	  	end 
    end
end
