class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :user_id, null: false
      t.string :code, null: false
      t.string :offer_type, null: false
      t.string :property_type, default: 'residential', null: false
      t.string :category, null: false                                # :realty_type
      t.boolean :new_flat, default: false, null: false               # :is_new_building
      t.integer :region_id, null: false
      t.integer :district_id, null: false
      t.integer :locality_id
      t.string :address                                              # :street
      t.string :direction
      t.float :distance
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.boolean :latlng_added_manually, default: false, null: false
      t.integer :metro_station_id
      t.float :metro_time_on_transport
      t.float :metro_time_on_foot
      t.string :railway_station
      t.text :images_list
      t.integer :rooms                                               # :rooms_count
      t.integer :rooms_offered
      t.float   :area                                                # :total_area
      t.float   :living_space                                        # :living_area
      t.text    :rooms_spaces
      t.float   :kitchen_space                                       # :kitchen_area
      t.float   :lot_area                                            # :land_area
      t.string  :lot_type
      t.string  :area_unit                                           # :land_unit
      t.integer :floor
      t.integer :floors_total                                        # :floors_count
      t.string :title_uk
      t.string :title_ru
      t.string :title_en
      t.text :description
      t.text :description_uk
      t.text :description_ru
      t.text :description_en
      t.string :renovation
      t.string :quality
      t.boolean :open_plan
      t.string  :rooms_type
      t.boolean :phone
      t.boolean :internet
      t.boolean :room_furniture
      t.boolean :kitchen_furniture
      t.boolean :television
      t.boolean :washing_machine
      t.boolean :refrigerator
      t.string  :balcony
      t.string  :bathroom_unit                                       # :bathroom_type
      t.string  :floor_covering
      t.string  :window_view
      t.string  :building_name
      t.string :building_type                                        # :walls_type
      t.string :building_series
      t.string :building_phase
      t.string :building_section
      t.string :building_state
      t.integer :built_year
      t.integer :ready_quarter
      t.boolean :lift
      t.boolean :rubbish_chute
      t.boolean :is_elite
      t.boolean :parking
      t.boolean :alarm
      t.float :ceiling_height
      # Houses
      t.boolean :pmg
      t.string :toilet
      t.string :shower
      t.boolean :kitchen
      t.boolean :pool
      t.boolean :billiard
      t.boolean :sauna
      t.boolean :heating_supply
      t.boolean :water_supply
      t.boolean :sewerage_supply
      t.boolean :electricity_supply
      t.boolean :gas_supply
      # Price
      t.float :price, null: false
      t.string :price_currency, null: false                          # :currency
      t.string :price_unit
      t.string :price_period
      t.float :price_m2                                              # :meter_price
      t.float :price_dollars                                         # :usd_price
      t.float :price_m2_dollars                                      # :usd_meter_price
      t.boolean :not_for_agents
      t.boolean :haggle
      t.boolean :mortgage
      t.float :prepayment
      t.boolean :rent_pledge
      t.boolean :from_owner, default: false, null: false             # :is_owner
      t.float :agent_fee
      t.boolean :no_agent_fee                                        # :no_commission
      t.string :deal_status
      t.boolean :with_pets
      t.boolean :with_children
      t.boolean :manually_added, default: true, null: false
      t.datetime :expires_at
      t.boolean :urgent, default: false, null: false
      t.string :phone_first, null: false
      t.string :phone_second
      t.string :phone_third
      t.string :phone_fourth
      t.string :user_name                                            # :contact
      t.string :user_email                                           # :email
      t.boolean :active, default: true, null: false                  # :is_active
      t.boolean :imported, default: false, null: false

      t.timestamps null: false
    end

    add_index :offers, :offer_type
    add_index :offers, :category
    add_index :offers, :region_id
    add_index :offers, :district_id
    add_index :offers, :locality_id
    add_index :offers, :rooms
    add_index :offers, :price
    add_index :offers, :updated_at
    add_index :offers, :user_id
    add_index :offers, [:user_id, :code], unique: true
  end
end
