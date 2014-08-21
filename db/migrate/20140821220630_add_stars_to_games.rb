class AddStarsToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :rating, :decimal, null: false, default: 0
	add_column :games, :ratings_count, :integer, null: false, default: 0
	add_column :games, :rating_total, :integer, null: false, default: 0
  end
  def self.down
    remove_column :games, :ratings_count
	remove_column :games, :rating_total
  end
end
