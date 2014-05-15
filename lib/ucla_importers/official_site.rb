require 'feedjira'

class BruinsOfficialSiteImporter
  def self.import
    source = "Official Site"
    feed = Feedjira::Feed.fetch_and_parse("http://www.uclabruins.com/rss.dbml?db_oem_id=30500&media=news")
    
    if defined? feed.entries
      feed.entries.each do |entry|
        Bruin.where(url: entry.url).first_or_create(
          title:      entry.title,
          author:     entry.author,
          summary:    entry.summary,
          url:        entry.url,
          published:  entry.published,
          source:     source,
        )
        if defined? entry.image && !entry.image 
          url = Bruin.where(url: entry.url).first
          url.update(image: entry.image)
        end
      end
    end
  end
end