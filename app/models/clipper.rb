class Clipper < ActiveRecord::Base

  # Limit stories to 10 and order them by most recent
  def self.limit_and_order
    limit(10).order('published DESC')
  end

end
