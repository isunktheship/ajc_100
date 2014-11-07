class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :address

      t.timestamps
    end
  end
end
