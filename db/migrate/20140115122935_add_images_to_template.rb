class AddImagesToTemplate < ActiveRecord::Migration
  def change
  	add_attachment :templates,:main_image
	  add_attachment :templates,:slider1
	  add_attachment :templates,:slider2
	  add_attachment :templates,:slider3
	  add_attachment :templates,:slider4
  end
end
