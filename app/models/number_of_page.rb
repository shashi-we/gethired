class NumberOfPage < ActiveRecord::Base
	belongs_to :template,:inverse_of=>:number_of_pages
end