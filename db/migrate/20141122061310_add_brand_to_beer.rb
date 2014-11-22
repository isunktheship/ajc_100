class AddBrandToBeer < ActiveRecord::Migration
  def change
    add_reference :breweries, :brand, index: true
    add_reference :beers, :brand, index: true
  end
end
