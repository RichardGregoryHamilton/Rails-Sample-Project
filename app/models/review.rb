class ReviewValidator < ActiveModel::Validator

  def validate (review)
    valid_regex = [/\d{25}/, /[a-z]{30}/, /\w{30}/, /\W{5}/]
    unless valid_regex.all? { |regex| review.body.scan(regex).empty? }
      review.errors[:body] << "This does not meet our quality standards"
    end
  end

end

class Review < ActiveRecord::Base

  include ActiveModel::Validations
  validates_with ReviewValidator

  before_validation :delete_words

  belongs_to :game

  validates_presence_of :username, :body

  validates :body, length: {in: 10..2000}

  private

    file = File.read("#{Rails.root}/public/words.txt")
    @words = file.split

    def delete_words

      aw = (@words + @words.map(&:capitalize) + @words.map(&:downcase))
      aw.map! { |word| word.tr("A-Za-z", "N-ZA-Mn-za-m") }

      word_list = aw.map { |word| word.gsub(/[AEGIOSTaegiost]/,
                'A' => '4', 'E' => '3', 'G' => '6', 'I' => '!', 'O' => '0',
                'S' => '5', 'T' => '7', 'a' => '4', 'e' => '3', 'g' => '6',
                'i' => '!', 'o' => '0', 's' => '5', 't' => '7')} +
                aw.map { |w| w.gsub('a', '4') } + aw.map { |w| w.sub('a', '4') } +
                aw.map { |w| w.gsub('e', '3') } + aw.map { |w| w.sub('e', '3') } +
                aw.map { |w| w.gsub('g', '6') } + aw.map { |w| w.sub('g', '6') } +
                aw.map { |w| w.gsub('i', '!') } + aw.map { |w| w.gsub('o', '0') } +
                aw.map { |w| w.sub('o', '0') } +  aw.map { |w| w.gsub('s', '5') } +
                aw.map { |w| w.sub('s', '5') } + aw.map { |w| w.gsub('t', '7') } +
                aw.map{ |w| w.sub('t', '7') }

  word_list.each { |word| self.body.gsub!(word, '') }

  end

end
