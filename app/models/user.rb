class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_attached_file :document,
    :storage => :s3, 
    :bucket => 'gethired.io',
    :path => "/users/:attachment/:id/:style.:extension",
    :s3_credentials => {:access_key_id => Setting.where(:account_type=>'s3').first.access_key, :secret_access_key => Setting.where(:account_type=>'s3').first.secret_access},
    :s3_protocol => 'https'
  validates_attachment :document
end
