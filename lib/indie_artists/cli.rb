#our CLI controller

class CurrentlyTrending::CLI

  def call
    CurrentlyTrending::Artist.scrape_currently_trending
    start
  end

  def start
    list_artists
    make_selection
  end

  def list_artists
    puts "Indie Artist of the past two weeks:"
    CurrentlyTrending::Artist.all.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def make_selection
    puts "Type the number of the artist for more info, or exit to conclude your query."
    input = gets.strip
    if input == "1"
      puts CurrentlyTrending::Artist.all[0].desc
      start
    elsif input == "2"
      puts CurrentlyTrending::Artist.all[1].desc
      start
    elsif input == "exit"
      goodbye
    else
      puts "invalid input"
      start
    end
  end

  def goodbye
    puts "Check back another time to see new artists of the week!"
  end

end
