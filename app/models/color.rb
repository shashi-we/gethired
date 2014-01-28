class Color < ActiveRecord::Base
	belongs_to :template,:inverse_of=>:colors
	validates :title,:price,:presence=>true
end
