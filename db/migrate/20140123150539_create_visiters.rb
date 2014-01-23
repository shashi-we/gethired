class CreateVisiters < ActiveRecord::Migration
  def change
    create_table :visiters do |t|
      t.string  :email_id
      t.string  :template_name
      t.integer :price

      t.timestamps
    end
  end
end