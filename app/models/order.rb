class Order < ActiveRecord::Base
  belongs_to :user,:inverse_of=>:orders
  has_attached_file :document,
    :storage => :s3, 
    :bucket => 'gethired.io',
    :path => "/orders/:attachment/:id/:style.:extension",
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_protocol => 'https'
  
  attr_accessor :delete_document
  before_validation { self.document.clear if self.delete_document == '1' } 

  rails_admin do
    edit do
    	field :template_name do 
      
      end
      field :template_price do 
      
      end
      field :complete_day do 
      
      end
      field :complete_day_price do 
      
      end
      field :number_of_page do 
      
      end
      field :page_price do 
      
      end
      field :color do 
      
      end
      field :color_price do 
      
      end
      field :user_id do 
      
      end

      field :status,:enum do 
        enum do
			    [ [ 'Processing', 'Processing' ], [ 'Designing', 'Designing' ], [ 'Revisions', 'Revisions' ], [ 'Completed', 'Completed' ]]
			  end
      end

      field :document do 
      
      end
    end
  end
  
end
