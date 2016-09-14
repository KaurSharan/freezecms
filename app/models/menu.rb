class Menu < ActiveRecord::Base
	has_many :submenus
	has_many :pages

	validates_presence_of :name, :link, :position
	validates_uniqueness_of :name
	  # validates :name, format: { with: /\A[a-zA-Z]+\z/,
   #  message: "only allows letters" }
end
