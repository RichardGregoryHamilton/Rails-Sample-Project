class AddStarsToGames < ActiveRecord::Migration
  def change
    add_column :games, :rating, :decimal, null: false, default: 0
  end
end
