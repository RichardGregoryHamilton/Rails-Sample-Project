class Game < ActiveRecord::Base
  
  belongs_to :user
  has_many :favorite_games
  has_many :favorited_by, through: :favorite_games, source: :user
  
  validates_presence_of :title, :console, :genre, :released_on
  validates :title, uniqueness: true, length: {maximum: 50}
  validates :released_on, length: {is: 4}
  validates :console, length: {maximum: 30}
  validates :genre, length: {maximum: 30}
  validates_inclusion_of :released_on, :in => (1950..(Time.now.year + 10)), :message => "is not in a logical time range"
  
  def self.all_consoles
    %w(Atari NES SNES N64 Gamecube Wii WiiU Dreamcast Genesis PS PS2 PS3 Xbox Xbox360)
  end
  
end