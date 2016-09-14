class UserDetail < ActiveRecord::Base
	belongs_to :user

	 validates_presence_of :first_name,:last_name,:number
	# validates_uniqueness_of :email
	# validates_format_of :number,:with => /\d{3}-\d{3}-\d{4}/
end
