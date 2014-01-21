class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :account_type
      t.string :access_key
      t.string :secret_access

      t.timestamps
    end
  end
end
