# encoding: utf-8
# == Schema Information
#
# Table name: offers
#
#  id                      :integer          not null, primary key
#  user_id                 :integer          not null
#  code                    :string(255)      not null
#  offer_type              :string(255)      not null
#  property_type           :string(255)      default("residential"), not null
#  category                :string(255)      not null
#  new_flat                :boolean          default(FALSE), not null
#  region_id               :integer          not null
#  district_id             :integer          not null
#  locality_id             :integer
#  address                 :string(255)
#  direction               :string(255)
#  distance                :float(24)
#  lat                     :decimal(10, 6)
#  lng                     :decimal(10, 6)
#  latlng_added_manually   :boolean          default(FALSE), not null
#  metro_station_id        :integer
#  metro_time_on_transport :float(24)
#  metro_time_on_foot      :float(24)
#  railway_station         :string(255)
#  images_list             :text(65535)
#  rooms                   :integer
#  rooms_offered           :integer
#  area                    :float(24)
#  living_space            :float(24)
#  rooms_spaces            :text(65535)
#  kitchen_space           :float(24)
#  lot_area                :float(24)
#  lot_type                :string(255)
#  area_unit               :string(255)
#  floor                   :integer
#  floors_total            :integer
#  title_uk                :string(255)
#  title_ru                :string(255)
#  title_en                :string(255)
#  description             :text(65535)
#  description_uk          :text(65535)
#  description_ru          :text(65535)
#  description_en          :text(65535)
#  renovation              :string(255)
#  quality                 :string(255)
#  open_plan               :boolean
#  rooms_type              :string(255)
#  phone                   :boolean
#  internet                :boolean
#  room_furniture          :boolean
#  kitchen_furniture       :boolean
#  television              :boolean
#  washing_machine         :boolean
#  refrigerator            :boolean
#  balcony                 :string(255)
#  bathroom_unit           :string(255)
#  floor_covering          :string(255)
#  window_view             :string(255)
#  building_name           :string(255)
#  building_type           :string(255)
#  building_series         :string(255)
#  building_phase          :string(255)
#  building_section        :string(255)
#  building_state          :string(255)
#  built_year              :integer
#  ready_quarter           :integer
#  lift                    :boolean
#  rubbish_chute           :boolean
#  is_elite                :boolean
#  parking                 :boolean
#  alarm                   :boolean
#  ceiling_height          :float(24)
#  pmg                     :boolean
#  toilet                  :string(255)
#  shower                  :string(255)
#  kitchen                 :boolean
#  pool                    :boolean
#  billiard                :boolean
#  sauna                   :boolean
#  heating_supply          :boolean
#  water_supply            :boolean
#  sewerage_supply         :boolean
#  electricity_supply      :boolean
#  gas_supply              :boolean
#  price                   :float(24)        not null
#  price_currency          :string(255)      not null
#  price_unit              :string(255)
#  price_period            :string(255)
#  price_m2                :float(24)
#  price_dollars           :float(24)
#  price_m2_dollars        :float(24)
#  not_for_agents          :boolean
#  haggle                  :boolean
#  mortgage                :boolean
#  prepayment              :float(24)
#  rent_pledge             :boolean
#  from_owner              :boolean          default(FALSE), not null
#  agent_fee               :float(24)
#  no_agent_fee            :boolean
#  deal_status             :string(255)
#  with_pets               :boolean
#  with_children           :boolean
#  manually_added          :boolean          default(TRUE), not null
#  expires_at              :datetime
#  urgent                  :boolean          default(FALSE), not null
#  phone_first             :string(255)      not null
#  phone_second            :string(255)
#  phone_third             :string(255)
#  phone_fourth            :string(255)
#  user_name               :string(255)
#  user_email              :string(255)
#  active                  :boolean          default(TRUE), not null
#  imported                :boolean          default(FALSE), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

FactoryGirl.define do
  factory :offer do
    user
    offer_type { Offer::TYPES.sample }
    category { Offer::CATEGORIES.sample }
    region
    district
    locality
    price 35000
    price_currency 'USD'
    phone_first '+380449876543'

    after(:build) do |offer, evaluator|
      offer.price_period = 'month' if offer.rent?
    end
  end
end
