require 'feedjira'

class SparksESPNSiteImporter
  def self.import
    source = "ESPN"
    feed = Feedjira::Feed.fetch_and_parse("http://search.espn.go.com/rss/los-angeles-sparks/")
    
    if defined? feed.entries
      feed.entries.each do |entry|
        Spark.where(url: entry.url).first_or_create(
          title:      entry.title,
          author:     entry.author,
          summary:    entry.summary,
          url:        entry.url,
          published:  entry.published,
          source:     source,
        )
        if defined? entry.image && !entry.image 
          url = Spark.where(url: entry.url).first
          url.update(image: entry.image)
        end
      end
    end
  end
end