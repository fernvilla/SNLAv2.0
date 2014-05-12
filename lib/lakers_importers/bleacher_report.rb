require 'feedjira'

class BleacherReportImporter
  def self.import
    source = "Bleacher Report"
    feeds = [
      Feedjira::Feed.fetch_and_parse("http://bleacherreport.com/articles/feed?tag_id=203")
    ]
    
    feeds.each do |feed|
      if defined? feed.entries
        feed.entries.each do |entry|
          Laker.where(url: entry.url).first_or_create(
            title:      entry.title,
            author:     entry.author,
            summary:    entry.summary,
            url:        entry.url,
            published:  entry.published,
            source:     source,
          )
          if defined? entry.image
            url = Laker.where(url: entry.url).first
            if !url.image
              url.update(image: entry.image)
            end
          end
        end
      end
    end
  end
end