class Game < ActiveRecord::Base
  
  before_validation :console_conversions,:convert_console, :convert_genre
	
	after_initialize do |game|
      game.ratings_count ||= 0
      game.rating_total ||= 0
    end
	
  CONSOLES = ['Atari', 'Nintendo', 'Super Nintendo', 'Nintendo 64', 'Gamecube', 'Wii', 'Wii U', 'Game Boy Color', 'Game Boy Advance', 'Turbo Express',
  'Neo Geo', 'Game Gear', 'Genesis', 'Dreamcast', 'Saturn', 'Playstation', 'Playstation 2', 'Playstation 3', 'Playstation 4', 'Xbox', 'Xbox 360',
  'Xbox One', 'PC', 'IOS', 'Vita']
  
  GENRES = ['Action', 'Action Adventure', 'Action RPG', 'Adventure', 'Arcade', 'Fighting', 'First Person Shooter', 'MMORPG', 'Music', 'Party', 'Platform', 
  'Puzzle', 'Racing', 'Rail Shooter', 'Role Playing Game', 'RPG', 'Sandbox', 'Shoot-em-up', 'Sim', 'Simulation', 
  'Sports', 'Strategy', 'Survival Horror', 'Third Person Shooter', 'Tower Defense']

  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_many :reviews, dependent: :destroy
  has_many :images, dependent: :destroy
  
  validates_presence_of :title, :console, :genre, :release_date
  validates :title, uniqueness: true, length: {maximum: 60}
  validates :release_date, length: {is: 4, :message => 'should be 4 numbers'}
  validates_inclusion_of :genre, :in => GENRES
  validates_inclusion_of :console, :in => CONSOLES
  validates_inclusion_of :release_date, :in => (1950..(Time.now.year + 10)), :message => "is not in a logical time range"
  
  def self.all_consoles
    %w(Atari NES SNES N64 Gamecube Wii WiiU Dreamcast Genesis PS PS2 PS3 Xbox Xbox360)
  end
  
  # Algorithm to rate games

  def add_rating(rating)
    return if rating.to_i == 0

    self.ratings_count += 1
    self.rating_total += rating.to_i
    self.rating = (rating_total.to_f / ratings_count).round(2)
    self.save
  end

  def rating
    return 0 if ratings_count == 0
   (rating_total.to_f / ratings_count).round(2)
  end
  
  # Conversion methods for user input
  
  def convert_console
	self.console = self.console.titleize unless self.console == 'IOS' || self.console == 'PC'
  end
  
  def convert_genre
    self.genre = self.genre.titleize unless self.genre == 'RPG'
  end
  
  def console_conversions
    self.console = self.console.gsub('gba', 'Game Boy Advance')
	self.console = self.console.gsub('gbc', 'Game Boy Color')
	self.console = self.console.gsub('n64', 'Nintendo 64')
	self.console = self.console.gsub('snes', 'Super Nintendo')
	self.console = self.console.gsub('nes', 'Nintendo') unless self.console == 'snes' || self.console == 'genesis'
	self.console = self.console.gsub('iphone', 'IOS')
	self.console = self.console.gsub('Xbox360', 'Xbox 360')
	self.console = self.console.gsub('ps', 'Playstation')
  end
  
end