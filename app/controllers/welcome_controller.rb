class WelcomeController < ApplicationController

  def asides
    off_canvas_test
  end

  def search
    style = params[:style] != "" ? params[:style] : ""
    ibu_low = params[:ibu][0] != "" ? params[:ibu][0] : 0
    ibu_high = params[:ibu][1] != "" ? params[:ibu][1] : 500
    abv_low = params[:abv][0] != "" ? params[:abv][0] : 0
    abv_high = params[:abv][1] != "" ? params[:abv][1] : 500

    @results = Brewery.joins(:beers).
        where("beers.style like '%#{style}%'").
        where("beers.ibu >= #{ibu_low}").
        where("beers.ibu <= #{ibu_high}").
        where("beers.abv >= #{abv_low}").
        where("beers.abv <= #{abv_high}").
        group("breweries.name").select("breweries.name as brewery_name, breweries.latitude as brewery_latitude, breweries.longitude as brewery_longitude, count(beers.id) as beer_count").order("brewery_name")


    @breweries = []
    @results.each do |x|
      row = [x.brewery_name, x.brewery_latitude, x.brewery_longitude, x.beer_count]
      @breweries.push(row)
    end

    @breweries_json = @breweries.to_json.to_s.html_safe

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
