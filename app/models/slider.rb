class Slider < ActiveRecord::Base
	belongs_to :page

	#validates_presence_of :pic
end