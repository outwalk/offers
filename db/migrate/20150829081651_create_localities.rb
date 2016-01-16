class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.integer :region_id, null: false
      t.integer :district_id, null: false
      t.string :slug, null: false
      t.string :category, null: false
      t.string :name_uk, null: false
      t.string :name_ru, null: false
      t.string :name_en, null: false
      t.string :phone_code
      t.boolean :non_admin, default: false, null: false
      t.decimal :latitude, precision: 12, scale: 8
      t.decimal :longitude, precision: 12, scale: 8
      t.integer :offers_count, default: 0, null: false
      t.integer :mk_settle_id

      t.timestamps null: false
    end

    add_index :localities, :region_id
    add_index :localities, :district_id
    add_index :localities, :slug
    add_index :localities, :name_uk
    add_index :localities, :name_ru
    add_index :localities, :name_en
    add_index :localities, :mk_settle_id
  end
end
