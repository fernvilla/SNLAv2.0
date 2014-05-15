require 'feedjira'

class DucksOfficialSiteImporter
  def self.import
    source = "Official Site"
    feed = Feedjira::Feed.fetch_and_parse("http://ducks.nhl.com/rss/news.xml")
    
    if defined? feed.entries
      feed.entries.each do |entry|
        Duck.where(url: entry.url).first_or_create(
          title:      entry.title,
          author:     entry.author,
          summary:    entry.summary,
          url:        entry.url,
          published:  entry.published,
          source:     source,
        )
        if defined? entry.image && !entry.image 
          url = Duck.where(url: entry.url).first
          url.update(image: entry.image)
        end
      end
    end
  end
end