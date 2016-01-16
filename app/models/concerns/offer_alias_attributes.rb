module OfferAliasAttributes
  extend ActiveSupport::Concern

  included do
    alias_attribute :realty_type, :category
    alias_attribute :street, :address
    alias_attribute :contact, :user_name
    alias_attribute :email, :user_email
    alias_attribute :total_area, :area
    alias_attribute :living_area, :living_space
    alias_attribute :kitchen_area, :kitchen_space
    alias_attribute :land_unit, :area_unit
    alias_attribute :land_area, :lot_area
    alias_attribute :is_new_building, :new_flat
    alias_attribute :no_commission, :no_agent_fee
    alias_attribute :rooms_count, :rooms
    alias_attribute :floors_count, :floors_total
    alias_attribute :walls_type, :building_type
    alias_attribute :bathroom_type, :bathroom_unit
    alias_attribute :title, :title_ru
    alias_attribute :currency, :price_currency
    alias_attribute :is_owner, :from_owner
    alias_attribute :usd_price, :price_dollars
    alias_attribute :usd_meter_price, :price_m2_dollars

    attr_writer :meter_price, :ar_price, :usd_ar_price, :is_active
  end
end
