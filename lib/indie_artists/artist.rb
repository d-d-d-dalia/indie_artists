class CurrentlyTrending::Artist

  attr_accessor :name, :desc
  @@all = []

  def initialize(name, desc)
    @name = name
    @desc = desc
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.create(name, desc)
    self.new(name, desc).tap{|obj| obj.save}
  end

  def self.scrape_currently_trending
    doc = Nokogiri::HTML(open("https://www.theguardian.com/music/series/newbandoftheday"))
    artists = doc.css(".fc-item__content")
    artists.each do |artist|
      text = artist.text.split(")")
      textnotpublished = text[1].split("Published")
      moretext = text[0].gsub("New band of the week:", "").split("(")
      newartist = self.create(moretext[0].strip, textnotpublished[0].strip)
      #binding.pry
    end
  end

end
