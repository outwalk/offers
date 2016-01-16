class CreateMetroStations < ActiveRecord::Migration
  def change
    create_table :metro_stations do |t|
      t.integer :district_id, null: false
      t.string :name_uk, null: false
      t.string :name_en, null: false
      t.string :name_ru, null: false
      t.string :color, null: false
      t.integer :sequence, null: false

      t.timestamps null: false
    end

    add_index :metro_stations, :district_id
  end
end
