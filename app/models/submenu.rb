class Submenu < ActiveRecord::Base
	belongs_to :menu
	has_one :pages

	validates_presence_of :name,:link, :position
	validates_uniqueness_of :name
	  # validates :name, format: { with: /\A[a-zA-Z]+\z/,
   #  message: "only allows letters" }
end
