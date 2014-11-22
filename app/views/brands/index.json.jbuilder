json.array!(@brands) do |brand|
  json.extract! brand, :id, :name, :description, :image_url
  json.url brand_url(brand, format: :json)
end
