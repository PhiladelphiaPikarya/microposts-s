class AddAaaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :string
    add_column :users, :address, :string
    add_column :users, :area, :string
  end
end
