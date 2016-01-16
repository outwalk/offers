# encoding: utf-8
require 'open-uri'
require 'nokogiri'

module Importers
  class Yandex
    BATCH_SIZE = 1000
    OFFER_COLUMN_NAMES = Offer.column_names.map(&:to_sym) - [:id, :user_id, :code, :created_at]
    REALTY_TYPES = { 'комната'=>'room', 'квартира'=>'flat', 'дом'=>'house',
      'участок'=>'lot', 'flat'=>'flat', 'room'=>'room', 'house'=>'house', 'cottage'=>'house',
      'townhouse'=>'house', 'таунхаус'=>'house', 'часть дома'=>'house', 'house with lot'=>'house',
      'дом с участком'=>'house', 'дача'=>'house', 'lot'=>'lot',
      'земельный участок'=>'lot', 'жилищное и общественное строительство'=>'lot',
      'гараж'=>'garage', 'сельскохозяйственный'=>'lot', 'оздоровительно-рекреационный'=>'office',
      'коммерческий'=>'office', 'рекреационный объект'=>'office', 'торговая площадка'=>'office',
      'офис'=>'office', 'склад'=>'office', 'общепит'=>'office', 'промышленность'=>'office'}
    OFFER_TYPES = { 'продажа'=>'sale', 'аренда'=>'rent' }
    AREA_UNITS = { 'сот'=>'a', 'га'=>'ha' }
    BATHROOM_UNITS = { 'совмещенный'=>'combined', 'раздельный'=>'separate' }
    FROM_OWNER_MAP = { 'владелец'=>true, 'агентство'=>false, 'owner'=>true, 'agency'=>false }
    PRICE_UNITS = { 'кв. м'=>'m2', 'гектар'=>'ha', 'cотка'=>'a', 'sq.m'=>'m2', 'hectare'=>'ha', 'кв.м'=>'m2' }
    PRICE_PERIODS = { 'день'=>'day', 'месяц'=>'month', 'day'=>'day', 'month'=>'month' }
    REGION_IDS = {}
    REGION_DISTRICT_IDS = {}
    DISTRICT_LOCALITY_IDS = {}
    REGION_LOCALITY_IDS = {}
    METRO_STATIONS_IDS = {}

    def import_offers(options = {})
      offers = []
      ::Nokogiri::XML::Reader(open(@agency.import_url)).each do |node|
        next unless node.name == 'offer' && node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
        ob = ::Nokogiri::XML(node.outer_xml)
        offer = Offer.new(imported: true)
        offer.user_id = @agency.user_id
        offer.code = node.attribute('internal-id')
        offer.offer_type = OFFER_TYPES[ob.get('type')]
        offer.realty_type = REALTY_TYPES[ob.get('category')]
        offer.created_at = Time.parse(ob.get('creation-date'))
        offer.updated_at = Time.parse(ob.get('last-update-date'))

        # Location
        next unless set_region(ob.get('location/region'), offer)
        # district = ob.get('location/district')
        locality = ob.get('location/locality-name')
        sub_locality = ob.get('location/sub-locality-name')
        if set_region_district(locality, offer)
          set_district_locality(sub_locality, offer)
        elsif set_region_locality(locality, offer)
        end

        #binding.pry if options[:debug]
        next unless offer.district_id
        offer.address = ob.get('location/address')
        offer.direction = ob.get('location/direction')
        offer.distance = ob.get('location/distance')
        if metro_name = ob.get('location/metro/name') and set_metro_station(metro_name, offer)
          offer.metro_time_on_foot = ob.get('location/metro/time-on-foot')
        end

        # Details
        offer.description = ob.get('description')
        offer.rooms = ob.get('rooms') || ob.get('rooms-offered')
        offer.rooms_offered = ob.get('rooms-offered')
        offer.area = ob.get('area/value')
        offer.living_space = ob.get('living-space/value')
        offer.kitchen_space = ob.get('kitchen-space/value')
        if offer.lot_area = ob.get('lot-area/value')
          offer.area_unit = AREA_UNITS[ob.get('lot-area/unit')] || (offer.lot_area > 2 ? 'a' : 'ha')
        end
        offer.floor = ob.get('floor')
        offer.floors_total = ob.get('floors-total')
        offer.new_flat = true if ob.get('new-flat').in?(['да', 'true', '1', '+'])
        offer.bathroom_unit = BATHROOM_UNITS[ob.get('bathroom-unit')]
        offer.images_list = ob.css('image').map(&:text).join(',')
        offer.lat = ob.get('latitude')
        offer.lng = ob.get('longitude')

        # Contacts
        offer.user_name = ob.get('sales-agent/name')
        offer.phones = ob.css('sales-agent/phone').map(&:text)
        offer.user_email = ob.get('sales-agent/email')
        offer.from_owner = FROM_OWNER_MAP[ob.get('sales-agent/category')] if ob.get('sales-agent/category')

        # Price
        offer.price = ob.get('price/value').try(:to_f)
        offer.price_currency = ob.get('price/currency').try(:upcase)
        offer.price_unit = PRICE_UNITS[ob.get('price/unit')]
        offer.price_period = PRICE_PERIODS[ob.get('price/period')]

        # offer.generate_title!
        # offer.comb

        offers << offer

        if offers.size == BATCH_SIZE
          Offer.import offers, on_duplicate_key_update: OFFER_COLUMN_NAMES
          offers = []
        end
      end

      Offer.import offers, on_duplicate_key_update: OFFER_COLUMN_NAMES if offers.any?
    end

    private

      def initialize(agency)
        @agency = agency
      end

      def set_region(name, offer)
        offer.region_id = REGION_IDS[name] or
          REGION_IDS[name] = offer.region_id = Region.find_id_by_name(name)
      end

      def set_region_district(name, offer)
        REGION_DISTRICT_IDS[offer.region_id] ||= {}
        REGION_DISTRICT_IDS[offer.region_id][name] ||= District.where(region_id: offer.region_id).find_id_by_name(name)
        offer.district_id = REGION_DISTRICT_IDS[offer.region_id][name]
      end

      def set_district_locality(name, offer)
        DISTRICT_LOCALITY_IDS[offer.district_id] ||= {}
        DISTRICT_LOCALITY_IDS[offer.district_id][name] ||= Locality.where(district_id: offer.district_id).find_id_by_name(name)
        offer.locality_id = DISTRICT_LOCALITY_IDS[offer.district_id][name]
      end

      def set_region_locality(name, offer)
        REGION_LOCALITY_IDS[offer.region_id] ||= {}
        REGION_LOCALITY_IDS[offer.region_id][name] ||= Locality.where(region_id: offer.region_id).find_id_by_name(name, with_district_id: true)
        offer.district_id, offer.locality_id = REGION_LOCALITY_IDS[offer.region_id][name]
      end

      def set_metro_station(name, offer)
        METRO_STATIONS_IDS[offer.district_id] ||= {}
        METRO_STATIONS_IDS[offer.district_id][name] ||= MetroStation.where(district_id: offer.district_id).find_id_by_name(name)
        offer.metro_station_id = METRO_STATIONS_IDS[offer.district_id][name]
      end

  end
end
