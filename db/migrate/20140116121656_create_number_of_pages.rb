class CreateNumberOfPages < ActiveRecord::Migration
  def change
    create_table :number_of_pages do |t|
      t.integer :template_id
      t.string :title
      t.integer :price

      t.timestamps
    end
  end
end
