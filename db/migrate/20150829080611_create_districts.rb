class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :region_id, null: false
      t.string :slug, null: false
      t.string :district_name_uk
      t.string :name_uk, null: false
      t.string :district_name_ru
      t.string :name_ru, null: false
      t.string :district_name_en
      t.string :name_en, null: false
      t.string  :phone_code
      t.boolean :region_status, default: false, null: false
      t.decimal :latitude,  precision: 12, scale: 8
      t.decimal :longitude, precision: 12, scale: 8
      t.integer :offers_count, default: 0, null: false
      t.integer :mk_district_id
      t.boolean :has_metro, default: false, null: false

      t.timestamps null: false
    end

    add_index :districts, :region_id
    add_index :districts, :slug
    add_index :districts, :district_name_uk
    add_index :districts, :name_uk
    add_index :districts, :district_name_ru
    add_index :districts, :name_ru
    add_index :districts, :district_name_en
    add_index :districts, :name_en
    add_index :districts, :mk_district_id
  end
end
