class AddDocumentToOrder < ActiveRecord::Migration
  def up
  	add_attachment :orders,:document
  end

  def down
  	remove_attachment :orders, :document
  end
end
