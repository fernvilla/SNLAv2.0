require 'feedjira'

class ESPNImporter
  def self.import
    source = "ESPN"
    feeds = [
      Feedjira::Feed.fetch_and_parse("http://espn.go.com/blog/feed?blog=los-angeleslakers"),
      Feedjira::Feed.fetch_and_parse("http://search.espn.go.com/rss/lakers/")
    ]
    
    feeds.each do |feed|
      if defined? feed.entries
        feed.entries.each do |entry|
          # Remove '#x26;' from titles
          title = entry.title.gsub(/#x26;/, '')
          Laker.where(url: entry.url).first_or_create(
            title:      title,
            author:     entry.author,
            summary:    entry.summary,
            url:        entry.url,
            published:  entry.published,
            source:     source,
          )
          if defined? entry.image && entry.image == null
            url = Laker.where(url: entry.url).first
            url.update(image: entry.image)
          end
        end
      end
    end
  end
end