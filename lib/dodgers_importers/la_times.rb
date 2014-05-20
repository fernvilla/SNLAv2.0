require 'feedjira'

class DodgersLATimesImporter
  def self.import
    source = "LA Times"
    feeds = [
      Feedjira::Feed.fetch_and_parse("http://www.latimes.com/sports/dodgers/dodgersnow/rss2.0.xml"),
      Feedjira::Feed.fetch_and_parse("http://www.latimes.com/sports/dodgers/rss2.0.xml")
    ]
    
    feeds.each do |feed|
      if defined? feed.entries
        feed.entries.each do |entry|
          Dodger.where(title: entry.title).first_or_create(
            title:      entry.title,
            author:     entry.author,
            summary:    entry.summary,
            url:        entry.url,
            published:  entry.published,
            source:     source,
          )
          if defined? entry.image && !entry.image 
            title = Dodger.where(title: entry.title).first
            title.update(image: entry.image)
          end
        end
      end
    end
  end
end