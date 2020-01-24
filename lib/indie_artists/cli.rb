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
      #binding.pry
      puts "#{i}. #{artist.name}"
    end
  end

  def make_selection
    puts "Type the number of the artist for more info, or exit to conclude your query. To see the list again, and make another selection, type more."
    puts ""
    input = gets.strip
    if input == "exit"
      goodbye
    elsif input == "more"
       start
    else
      puts CurrentlyTrending::Artist.all[input.to_i-1].desc
    end
  end

  def goodbye
    puts "Check back another time to see new bands of the week!"
  end

end
