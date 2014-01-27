class AddFieldsToTemplate < ActiveRecord::Migration
  def change
    add_column :templates, :offer_name, :string
    add_column :templates, :offer_discount, :integer
  end
end
