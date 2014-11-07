json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :brewery_id, :style, :abv, :ibu, :beer_advocate_average
  json.url beer_url(beer, format: :json)
end
