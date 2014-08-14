class AddAgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :birthday, :string
    add_column :users, :location, :string
  end
end
