json.array!(@breweries) do |brewery|
  json.extract! brewery, :id, :name, :latitude, :longitude, :address
  json.url brewery_url(brewery, format: :json)
end
