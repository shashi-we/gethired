class AddDigitalFileToTemplate < ActiveRecord::Migration
  def up
  	add_attachment :templates,:digital_download
  	add_column :templates, :digital_price, :integer
  end

  def down
  	remove_attachment :templates, :digital_download
  	remove_column :templates, :digital_price
  end
end
