class AddDocumentToUser < ActiveRecord::Migration
  def up
  	add_attachment :users,:document
  end


  def down
  	remove_attachment :users, :document
  end
end
