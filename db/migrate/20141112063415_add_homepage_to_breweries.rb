class AddHomepageToBreweries < ActiveRecord::Migration
  def change
    remove_column :breweries, :url
    add_column :breweries, :homepage, :string
  end
end
