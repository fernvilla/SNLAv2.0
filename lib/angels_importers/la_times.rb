require 'feedjira'

class AngelsLATimesImporter
  def self.import
    source = "LA Times"
    feed = Feedjira::Feed.fetch_and_parse("http://www.latimes.com/sports/angels/rss2.0.xml")
    
    if defined? feed.entries
      feed.entries.each do |entry|
        Angel.where(title: entry.title).first_or_create(
          title:      entry.title,
          author:     entry.author,
          summary:    entry.summary,
          url:        entry.url,
          published:  entry.published,
          source:     source,
        )
        if defined? entry.image && !entry.image 
          title = Angel.where(title: entry.title).first
          title.update(image: entry.image)
        end
      end
    end
  end
end