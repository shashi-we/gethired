class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_attached_file :document,
    :storage => :s3, 
    :bucket => 'gethired.io',
    :path => "/users/:attachment/:id/:style.:extension",
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_protocol => 'https'
   validates_attachment :document
end
