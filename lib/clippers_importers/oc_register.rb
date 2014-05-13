require 'feedjira'

class ClippersOCRegisterImporter
  def self.import
    source = "OC Register"
    feed = Feedjira::Feed.fetch_and_parse("http://www.ocregister.com/common/rss/rss.php?catID=19965")
    

    if defined? feed.entries
      feed.entries.each do |entry|
        Clipper.where(url: entry.url).first_or_create(
          title:      entry.title,
          author:     entry.author,
          summary:    entry.summary,
          url:        entry.url,
          published:  entry.published,
          source:     source,
        )
        if defined? entry.image && !entry.image 
          url = Clipper.where(url: entry.url).first
          url.update(image: entry.image)
        end
      end
    end
  end
end