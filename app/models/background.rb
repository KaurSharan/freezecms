class Background < ActiveRecord::Base
	belongs_to :page

	#validates_presence_of :photo
end
