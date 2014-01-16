class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.text :short_description
      t.text :detail_description
      t.integer :price
      t.timestamps
    end
  end
end
