require 'twitter'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class WelcomeController < ApplicationController

  def asides
    off_canvas_test
  end


  def twitter_01
    #config = {
    #    :consumer_key    => "xSxJYTrUl4cVPeM4Niw59TLwU",
    #    :consumer_secret => "o46vkjbt4Kew9BsiH91nuvw1Um5qwwMdKTP5ZFqFCFb9jyfs3g",
    #}


    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = "xSxJYTrUl4cVPeM4Niw59TLwU"
      config.consumer_secret     = "o46vkjbt4Kew9BsiH91nuvw1Um5qwwMdKTP5ZFqFCFb9jyfs3g"
      config.access_token        = "15424147-QcoVUD6afTIyGamOw32duraYxSdlaj3MtnNZQwC93"
      config.access_token_secret = "X2lTKShnUDaCo6mKzWoKJMCyrn2ST4PRST86a6os3MoOD"
    end

    #client = Twitter::REST::Client.new(config)
    #client.user("isunktheship")

    topics = ["beer", "mead"]
    users = ["StoneBrewingCo"]
    client.filter()
    client.filter(:track => topics.join(",")) do |object|
      puts object.text if object.is_a?(Twitter::Tweet)
    end

    #Twitter.user_timeline("StoneBrewingCo")

  end


  def search
    style = params[:style] != "" ? params[:style] : ""
    ibu_low = params[:ibu][0] != "" ? params[:ibu][0] : 0
    ibu_high = params[:ibu][1] != "" ? params[:ibu][1] : 500
    abv_low = params[:abv][0] != "" ? params[:abv][0] : 0
    abv_high = params[:abv][1] != "" ? params[:abv][1] : 500

    ibu_high = 500 if ibu_high.to_i == 100
    abv_high = 500 if abv_high.to_i == 20

    @results = Brewery.joins(:beers).
        where("beers.style like '%#{style}%'").
        where("beers.ibu >= #{ibu_low}").
        where("beers.ibu <= #{ibu_high}").
        where("beers.abv >= #{abv_low}").
        where("beers.abv <= #{abv_high}").
        group("breweries.name").select("breweries.name as brewery_name, breweries.latitude as brewery_latitude, breweries.longitude as brewery_longitude, count(beers.id) as beer_count").order("brewery_name")

    @beer_results = Brewery.joins(:beers).
        where("beers.style like '%#{style}%'").
        where("beers.ibu >= #{ibu_low}").
        where("beers.ibu <= #{ibu_high}").
        where("beers.abv >= #{abv_low}").
        where("beers.abv <= #{abv_high}").
        select("breweries.name as brewery_name, beers.name as beer_name, beers.ibu as beer_ibu, beers.abv as beer_abv, beers.style as beer_style").order("brewery_name")


    @breweries = []
    @results.each do |x|
      row = [x.brewery_name, x.brewery_latitude, x.brewery_longitude, x.beer_count]
      @breweries.push(row)
    end

    @beers = []
    @beer_results.each do |x|
      row = [x.brewery_name, x.beer_name, x.beer_style, x.beer_abv, x.beer_ibu]
      @beers.push(row)
    end

    @breweries_json = @breweries.to_json.to_s.html_safe
    @beers_json = @beers.to_json.to_s.html_safe

    render layout: false

  end

  def index
  end
  def off_canvas_test
    #puts params[:data]

    @breweries = Brewery.all.order("name ASC")
    @results = Brewery.joins(:beers).group("breweries.name").select("breweries.name as brewery_name, count(beers.id) as beer_count").order("brewery_name")

    #puts "++++++++++++++++++++++++++++++++++++++++++++"
    #puts @results
    #puts "++++++++++++++++++++++++++++++++++++++++++++"
  end
end
