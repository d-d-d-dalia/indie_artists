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
    end
    make_selection
  end

  def make_selection
    #binding.pry
    puts "Type the number of the artist for more info. To exit, type exit."
    puts ""
    #binding.pry
    input = gets.strip
    # if input == "exit"
    #   #binding.pry
    #   goodbye
    # end
    # if input != "exit" && input.to_i <= CurrentlyTrending::Artist.all.length && input.to_i > 0
    #   #binding.pry
    #   puts ""
    #   puts CurrentlyTrending::Artist.all[input.to_i-1].desc
    #   puts ""
    #   #binding.pry
    #   list_artists 
    # elsif input.to_i > CurrentlyTrending::Artist.all.length || input.to_i < 0
    #   puts ""
    #   puts "INVALID INPUT. Please try again."
    #   puts ""
    #   make_selection
    # end
    if input.to_i > CurrentlyTrending::Artist.all.length || input.to_i < 1 && input != "more" && input != "exit"
      puts ""
      puts "INVALID INPUT. Try again."
    end
    if input.to_i.between?(1, CurrentlyTrending::Artist.all.length)
      puts ""
      puts CurrentlyTrending::Artist.all[input.to_i-1].desc
      puts ""
      list_artists
    elsif input == "more"
      list_artists
    elsif input == "exit"
      #binding.pry
      #input = "exit"
      goodbye
    end

  end

  def goodbye
    puts ""
    puts "Check back another time to see new bands of the week!"
    exit
  end

end
