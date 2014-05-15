require 'feedjira'

class AngelsOfficialSiteImporter
  def self.import
    source = "Official Site"
    feed = Feedjira::Feed.fetch_and_parse("http://losangeles.angels.mlb.com/partnerxml/gen/news/rss/ana.xml")
    
    if defined? feed.entries
      feed.entries.each do |entry|
        Angel.where(url: entry.url).first_or_create(
          title:      entry.title,
          author:     entry.author,
          summary:    entry.summary,
          url:        entry.url,
          published:  entry.published,
          source:     source,
        )
        if defined? entry.image
          url = Angel.where(url: entry.url).first
          url.update(image: entry.image)
        end
      end
    end
  end
end