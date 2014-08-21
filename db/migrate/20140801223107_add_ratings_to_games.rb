class AddRatingsToGames < ActiveRecord::Migration
  def change
    add_column :games, :ratings_count, :integer
    add_column :games, :rating_total, :integer
  end
end
