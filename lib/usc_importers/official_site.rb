require 'feedjira'

class TrojansOfficialSiteImporter
  def self.import
    source = "Official Site"
    feed = Feedjira::Feed.fetch_and_parse("http://www.usctrojans.com/blog/atom.xml")
    
    if defined? feed.entries
      feed.entries.each do |entry|
        Trojan.where(url: entry.url).first_or_create(
          title:      entry.title,
          author:     entry.author,
          summary:    entry.summary,
          url:        entry.url,
          published:  entry.published,
          source:     source,
        )
        if defined? entry.image && !entry.image 
          url = Trojan.where(url: entry.url).first
          url.update(image: entry.image)
        end
      end
    end
  end
end