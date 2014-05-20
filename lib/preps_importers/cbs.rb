require 'feedjira'

class PrepsCBSImporter
  def self.import
    source = "CBS Los Angeles"
    feed = Feedjira::Feed.fetch_and_parse("http://losangeles.cbslocal.com/category/sports/high-school/feed/")
    
    if defined? feed.entries
      feed.entries.each do |entry|
        Prep.where(url: entry.url).first_or_create(
          title:      entry.title,
          author:     entry.author,
          summary:    entry.summary,
          url:        entry.url,
          published:  entry.published,
          source:     source,
        )
        if defined? entry.image && !entry.image 
          url = Prep.where(url: entry.url).first
          url.update(image: entry.image)
        end
      end
    end
  end
end