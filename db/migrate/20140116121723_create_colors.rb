class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.integer :template_id
      t.string :title
      t.integer :price

      t.timestamps
    end
  end
end
