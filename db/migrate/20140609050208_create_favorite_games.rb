class CreateFavoriteGames < ActiveRecord::Migration
  def change
    create_table :favorite_games do |t|
      t.string :game_id
      t.string :integer
      t.string :user_id
      t.string :integer
      t.string :favorite_id
      t.string :integer

      t.timestamps
    end
    add_index :favorite_games, :game_id
    add_index :favorite_games, :user_id
    add_index :favorite_games, :favorite_id
    add_index :favorite_games, [:game_id, :user_id, :favorite_id], unique: true
  end
end
