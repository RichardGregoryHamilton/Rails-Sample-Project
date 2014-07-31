class Game < ActiveRecord::Base
  
  GAMES = ['Atari', 'NES', 'Nintendo', 'SNES', 'Super Nintendo', 'Super Famicon', 'N64', 'Nintendo64', 'Gamecube', 
'Wii', 'Wii U', 'GBC', 'GBA', 'DS', 'Nintendo DS', 'TurboExpress', 'Neo Geo', 'Game Gear', 'Genesis', 'Dreamcast', 'Saturn', 'Playstation', 'PS', 'Playstation2', 'PS2', 'Playstation3', 'PS3',
'Playstation4', 'PS4', 'Xbox', 'Xbox360', 'XboxOne', 'PC', 'IOS', 'IPhone']

  GENRES = ['Action', 'Action Adventure', 'Action RPG', 'Adventure', 'Arcade', 
'Fighting', 'First Person Shooter', 'MMORPG', 'Music', 'Platform', 'Platfomer', 
'Puzzle','Racing', 'Rail Shooter', 'Role Playing Game', 'RPG', 'Sandbox', 'Shoot-em-up', 'Sim', 'Simulation', 
'Sports', 'Strategy', 'Survival Horror', 'Tactical RPG', 'Third Person Shooter', 'Tower Defense']
  
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  
  validates_presence_of :title, :console, :genre, :release_date
  validates :title, uniqueness: true, length: {maximum: 50}
  validates :release_date, length: {is: 4}
 validates_inclusion_of :genre, :in => GENRES
  validates_inclusion_of :console, :in => GAMES
  validates_inclusion_of :release_date, :in => (1950..(Time.now.year + 10)), :message => "is not in a logical time range"
  
  def self.all_consoles
    %w(Atari NES SNES N64 Gamecube Wii WiiU Dreamcast Genesis PS PS2 PS3 Xbox Xbox360)
  end

end