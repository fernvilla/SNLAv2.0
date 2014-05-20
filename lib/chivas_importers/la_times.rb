require 'feedjira'

class ChivasLATimesImporter
  def self.import
    source = "LA Times"
    feed = Feedjira::Feed.fetch_and_parse("http://www.latimes.com/rss/topic/sports/soccer/chivas-usa-ORSPT00000425-topic.html")
    
    if defined? feed.entries
      feed.entries.each do |entry|
        Chiva.where(title: entry.title).first_or_create(
          title:      entry.title,
          author:     entry.author,
          summary:    entry.summary,
          url:        entry.url,
          published:  entry.published,
          source:     source,
        )
        if defined? entry.image && !entry.image 
          title = Chiva.where(title: entry.title).first
          title.update(image: entry.image)
        end
      end
    end
  end
end