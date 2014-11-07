class Beer < ActiveRecord::Base
  has_many :brews
  has_many :breweries, through: :brews
end
