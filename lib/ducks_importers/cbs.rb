require 'feedjira'

class DucksCBSImporter
  def self.import
    source = "CBS Los Angeles"
    feed = Feedjira::Feed.fetch_and_parse("http://losangeles.cbslocal.com/category/sports/ducks/feed/")
    
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