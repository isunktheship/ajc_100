class Brewery < ActiveRecord::Base
  has_many :brews
  has_many :beers, through: :brews
  belongs_to :brand
end
