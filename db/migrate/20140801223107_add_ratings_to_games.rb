class AddRatingsToGames < ActiveRecord::Migration
  def change
    add_column :games, :ratings_count, :integer, null: false, default: 0
    add_column :games, :rating_total, :integer, null: false, default: 0
  end
end
