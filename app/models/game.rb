class Game < ActiveRecord::Base
 
 def to_param
   "#{id} #{title}".parameterize
 end

  after_initialize do |game|
    game.ratings_count ||= 0
    game.rating_total ||= 0
  end
	
  CONSOLES = [
							'Atari 2600', 'Nintendo', 'Super Nintendo', 'Nintendo 64',
							'Gamecube', 'Wii', 'Wii U', 'Game Boy Color', 'Game Boy Advance',
							'Nintendo DS', 'Turbo Express', 'Neo Geo', 'Game Gear', 'Genesis',
							'Dreamcast', 'Saturn', 'Playstation', 'Playstation 2',
							'Playstation 3', 'Playstation 4', 'Xbox', 'Xbox 360', 'Xbox One',
							'PC', 'IOS', 'Vita'
						 ]
  
  GENRES = [
						'Action', 'Action Adventure', 'Action RPG', 'Adventure', 'Arcade',
						'Fighting', 'First Person Shooter', 'MMORPG', 'Music', 'Party',
						'Platform', 'Puzzle', 'Racing', 'Rail Shooter', 'Role Playing Game',
						'RPG', 'Sandbox', 'Shoot-em-up', 'Sim', 'Simulation', 'Sports',
						'Strategy', 'Survival Horror', 'Third Person Shooter', 'Tower Defense'
					 ]

  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_many :reviews, dependent: :destroy
  has_many :images, dependent: :destroy
  
  VALID_DATE_REGEX = /\A(([1-9]|1[012])[-\/.]([1-9]|[12][0-9]|3[01])[-\/.](19|20)\d\d)|((1[012]|0[1-9])(3[01]|2\d|1\d|0[1-9])(19|20)\d\d)|((1[012]|0[1-9])[-\/](3[01]|2\d|1\d|0[1-9])[-\/](19|20)\d\d)\z/
  
  validates_presence_of :title, :console, :genre, :release_date
  validates :title, uniqueness: true, length: {maximum: 60}
  validates_inclusion_of :genre, :in => GENRES
  validates_inclusion_of :console, :in => CONSOLES
  validates :release_date, format: { with: VALID_DATE_REGEX }
  
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
  
end
