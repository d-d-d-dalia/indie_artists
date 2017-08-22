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
    puts "New bands of the past two weeks:"
    puts ""
    CurrentlyTrending::Artist.all.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
      puts ""
    end
  end

  def make_selection
    puts "Type the number of the artist for more info, or exit to conclude your query."
    puts ""
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
    puts ""
    puts "Check back another time to see new bands of the week!"
  end

end
