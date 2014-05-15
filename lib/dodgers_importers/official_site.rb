require 'feedjira'

class DodgersOfficialSiteImporter
  def self.import
    source = "Official Site"
    feed = Feedjira::Feed.fetch_and_parse("http://losangeles.dodgers.mlb.com/partnerxml/gen/news/rss/la.xml")
    
    if defined? feed.entries
      feed.entries.each do |entry|
        Dodger.where(url: entry.url).first_or_create(
          title:      entry.title,
          author:     entry.author,
          summary:    entry.summary,
          url:        entry.url,
          published:  entry.published,
          source:     source,
        )
        if defined? entry.image
          url = Dodger.where(url: entry.url).first
          url.update(image: entry.image)
        end
      end
    end
  end
end