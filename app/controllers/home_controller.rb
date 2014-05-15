class HomeController < ApplicationController
  def index
    @lakers = Laker.all.limit(10).order('published DESC')
    @clippers = Clipper.all.limit(10).order('published DESC')
  end
end
