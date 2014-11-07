class Brew < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :beer
end
