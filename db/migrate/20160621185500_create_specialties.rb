class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.boolean :weddings, default: false
      t.boolean :portraits, default: false
      t.boolean :businesses, default: false
      t.string :other_specialty
      t.references :photographers, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
