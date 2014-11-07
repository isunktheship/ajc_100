class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.decimal :abv
      t.decimal :ibu
      t.decimal :beer_advocate_average

      t.timestamps
    end
  end
end
