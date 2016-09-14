class Page < ActiveRecord::Base
	belongs_to :submenu
	belongs_to :menu
	has_one :banner
	has_one :background
	has_one :slider

	validates_presence_of :title,:description
	validates_uniqueness_of :title
	#validates :title, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
end
