class LakersController < ApplicationController
  def index
    @lakers = Laker.where(source: "Official Site").limit(10).order('published DESC')
  end
end
