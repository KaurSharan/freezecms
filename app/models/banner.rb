class Banner < ActiveRecord::Base
	belongs_to :page

	validates_presence_of :detail
end
