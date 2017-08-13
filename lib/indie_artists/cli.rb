#our CLI controller

class IndieArtists::CLI

  def call
    puts "Indie Artists currently trending:"
    list_artists
  end

  def list_artists
    puts trending_artists

end
