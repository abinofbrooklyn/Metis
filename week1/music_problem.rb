require 'csv'

class Music
attr_accessor :db
  def initialize
    @db = {}
  end

  def sort
    CSV.foreach("music.csv") do |row|
      artist_name = row[3]
      song_title = row[0]
      if db.has_key?(artist_name)
        db[artist_name] << song_title
      else
        db[artist_name] = [song_title]
      end
    end
  end

  def prompt
    sort
    puts db.keys
    print "Select an artist:"
    query = gets.chomp
    if @db.has_key?(query)
      puts @db.fetch(query)
    else
      puts "Artist is not in the database"
    end
    repeat
  end

  def repeat
    puts "Do you want to select another artist? Yes or No?"
    answer = gets.chomp.downcase
    if answer == "yes".downcase
      prompt
    end
  end
end

  

db = Music.new
db.prompt
