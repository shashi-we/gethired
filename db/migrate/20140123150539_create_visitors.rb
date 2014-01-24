class CreateVisitors < ActiveRecord::Migration
  def self.up
    create_table :visitors do |t|
      t.string  :email_id
      t.string  :template_name
      t.integer :price

      t.timestamps
    end
  end
  def self.down
  	drop_table :visiters
  end
end