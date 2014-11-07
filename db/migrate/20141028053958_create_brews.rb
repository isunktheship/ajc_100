class CreateBrews < ActiveRecord::Migration
  def change
    create_table :brews do |t|
      t.belongs_to :brewery
      t.belongs_to :beer
      t.timestamps
    end
  end
end
