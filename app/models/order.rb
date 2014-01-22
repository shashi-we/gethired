class Order < ActiveRecord::Base
  belongs_to :user,:inverse_of=>:orders
  has_attached_file :document,
    :storage => :s3, 
    :bucket => 'gethired.io',
    :path => "/orders/:attachment/:id/:style.:extension",
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_protocol => 'https'
  #validates_attachment :document, :presence => true

end
