class Brand < ActiveRecord::Base
  has_many :breweries
  has_many :beers
end
