class Blog < ActiveRecord::Base
	has_one :blogcomment
	belongs_to :user
end
