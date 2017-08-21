class CurrentlyTrending::Artist

  attr_accessor :name, :followers, :following, :tracks, :desc
  @@all = []

  def initialize(name = nil, desc = nil)
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
   names = doc.css(".fc-item__title .js-headline-text")
   artist_1_name = names[0].text.gsub("New band of the week: ", "").split(" (")[0]
   artist_2_name = names[1].text.gsub("New band of the week: ", "").split(" (")[0]
   descs = doc.css(".fc-item__standfirst")
   desc_1 = descs[0].text
   desc_2 = descs[1].text
   self.create(artist_1_name, desc_1)
   self.create(artist_2_name, desc_2)
 end

end
