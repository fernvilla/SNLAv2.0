class HomeController < ApplicationController
  def index
    @lakers = Laker.all.limit(10).order('published DESC')
    @clippers = Clipper.all.limit(10).order('published DESC')
    @dodgers = Dodger.all.limit(10).order('published DESC')
    @angels = Angel.all.limit(10).order('published DESC')
    @kings = King.all.limit(10).order('published DESC')
    @ducks = Duck.all.limit(10).order('published DESC')
    @chivas = Chiva.all.limit(10).order('published DESC')
    @galaxy = Galaxy.all.limit(10).order('published DESC')
    @sparks = Spark.all.limit(10).order('published DESC')
    @preps = Prep.all.limit(10).order('published DESC')
    @bruins = Bruin.all.limit(10).order('published DESC')
    @trojans = Trojan.all.limit(10).order('published DESC')
  end
end
