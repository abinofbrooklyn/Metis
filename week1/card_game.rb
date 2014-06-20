class Card
  attr_accessor :front, :back

  def initialize(attributes) 
    @front = attributes[:front]
    @back = attributes[:back]
  end

  def play
    print "#{front} >"
    guess = gets.chomp

    if correct?(guess)
      puts "Correct!"
    else
      puts "Wrong!"
    end
  end

  def correct?(guess)
    guess.downcase == back.downcase
  end
end

class Deck
  attr_reader :cards, :name

  def initialize(name, cards)
    @name = name
    @cards = cards
  end

  def play
     welcome
      cards.shuffle.each do |card|
        card.play 
    end
  end

  def welcome
     message = "Welcome to the #{name} deck."
     puts message
     puts "-"* message.size
  end
end

class FlashCardGame
  attr_reader :decks 

  def initialize(decks)
    @decks = decks
  end

  def play
    loop do
      deck = choose_deck
      if deck
        deck.play
      else
        puts "Bye!"
        break
      end
    end
  end

  def choose_deck
    decks.each do |deck|
      puts "Choose the #{deck.name.capitalize} deck"
    end 

      puts "Enter to exit"

    deck_name = gets.chomp

    if deck_name != ""
      decks.find do |deck|
        deck.name == deck_name.downcase
      end
    end
  end
end

class DeckReader
  attr_reader :file

  def initialize(file_name)
    @file = File.new(file_name, "r")
    @deck_count = @file.gets.to_i
  end

  def decks
    @deck_count.times.map do 
      deck_name = @file.gets.chomp
      Deck.new(deck_name, gets_card)
    end
  end

  def gets_card
    card_count = @file.gets.to_i
      card_count.times.map do 
      front = @file.gets.chomp
      back = @file.gets.chomp
      Card.new({front: front, back: back})
    end
  end
end

decks = DeckReader.new("decks.txt").decks
game = FlashCardGame.new(decks)
game.play
