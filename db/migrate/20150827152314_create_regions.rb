class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :slug, null: false
      t.string :name_uk, null: false
      t.string :name_ru, null: false
      t.string :name_en, null: false
      t.decimal :latitude, precision: 12, scale: 8
      t.decimal :longitude, precision: 12, scale: 8
      t.integer :offers_count, default: 0
      t.integer :mk_region_id

      t.timestamps null: false
    end

    add_index :regions, :slug
    add_index :regions, :name_uk
    add_index :regions, :name_ru
    add_index :regions, :name_en
    add_index :regions, :mk_region_id
  end
end
