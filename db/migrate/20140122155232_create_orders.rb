class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.integer :user_id	
      t.string :template_name 
      t.string :status
      t.string :total_price
      t.integer :template_price
      t.string :complete_day 
      t.integer :complete_day_price
      t.string :number_of_page
      t.integer :page_price
      t.string :color
      t.integer :color_price
      t.timestamps
    end
  end

  def down 
    drop_table :orders
  end
end
