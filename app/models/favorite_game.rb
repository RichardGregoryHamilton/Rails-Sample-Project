class FavoriteGame < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_many :favorites, :as => :favorite_games
end
