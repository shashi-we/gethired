class Template < ActiveRecord::Base
  validates :name,:price, presence: true
  has_many :number_of_pages, :inverse_of=>:template
  has_many :completion_days, :inverse_of=>:template
  has_many :colors , :inverse_of=>:template 
  #accepts_nested_attributes_for :template_attributes
  has_attached_file :main_image,
    # :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    # :url => "/system/:attachment/:id/:style/:filename"
    :styles => {:medium =>"373x260"},
    :storage => :s3, 
    :bucket => 'gethired.io',
    :default_url   => "/images/thumb/missing.png",
    :path => "/templates/:attachment/:id/:style.:extension",
    :s3_credentials =>"#{Rails.root}/config/s3.yml",
    :s3_protocol => 'https'
  has_attached_file :slider1,
    # :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    # :url => "/system/:attachment/:id/:style/:filename"
    :styles => {:medium =>"373x260"},
    :storage => :s3, 
    :bucket => 'gethired.io',
    :default_url   => "/images/thumb/missing.png",
    :path => "/templates/:attachment/:id/:style.:extension",
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_protocol => 'https'
  has_attached_file :slider2,
    :styles => {:medium =>"373x260"},
    :storage => :s3, 
    :bucket => 'gethired.io',
    :default_url   => "/images/thumb/missing.png",
    :path => "/templates/:attachment/:id/:style.:extension",
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_protocol => 'https'
  has_attached_file :slider3,
    :styles => {:medium =>"373x260"},
    :storage => :s3, 
    :bucket => 'gethired.io',
    :default_url   => "/images/thumb/missing.png",
    :path => "/templates/:attachment/:id/:style.:extension",
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_protocol => 'https'
  has_attached_file :slider4,
    :styles => {:medium =>"373x260"},
    :storage => :s3, 
    :bucket => 'gethired.io',
    :default_url   => "/images/thumb/missing.png",
    :path => "/templates/:attachment/:id/:style.:extension",
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_protocol => 'https'
end