class CompletionDay < ActiveRecord::Base
	belongs_to :template,:inverse_of=>:completion_days
	validates :title,:price,:presence=>true
end
