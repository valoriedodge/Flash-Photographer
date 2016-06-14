class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.decimal :lat, :precision => 8, :scale => 6, :null => false
      t.decimal :lng, :precision => 9, :scale => 6, :null => false

      t.timestamps null: false
    end
  end
end
