# encoding: utf-8
require 'spec_helper'
require 'shoulda-matchers'

describe Offer, type: :model do
  subject { build(:offer) }
  it { is_expected.to be_valid }
  it { expect(subject.save).to eq true }

  context 'Database' do
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:code).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:offer_type).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:property_type).of_type(:string).with_options(default: 'residential', null: false) }
    it { is_expected.to have_db_column(:category).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:new_flat).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:region_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:district_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:locality_id).of_type(:integer) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:direction).of_type(:string) }
    it { is_expected.to have_db_column(:distance).of_type(:float) }
    it { is_expected.to have_db_column(:lat).of_type(:decimal).with_options(precision: 10, scale: 6) }
    it { is_expected.to have_db_column(:lng).of_type(:decimal).with_options(precision: 10, scale: 6) }
    it { is_expected.to have_db_column(:latlng_added_manually).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:metro_station_id).of_type(:integer) }
    it { is_expected.to have_db_column(:metro_time_on_transport).of_type(:float) }
    it { is_expected.to have_db_column(:metro_time_on_foot).of_type(:float) }
    it { is_expected.to have_db_column(:railway_station).of_type(:string) }
    it { is_expected.to have_db_column(:images_list).of_type(:text) }
    it { is_expected.to have_db_column(:rooms).of_type(:integer) }
    it { is_expected.to have_db_column(:rooms_offered).of_type(:integer) }
    it { is_expected.to have_db_column(:area).of_type(:float) }
    it { is_expected.to have_db_column(:living_space).of_type(:float) }
    it { is_expected.to have_db_column(:rooms_spaces).of_type(:text) }
    it { is_expected.to have_db_column(:kitchen_space).of_type(:float) }
    it { is_expected.to have_db_column(:lot_area).of_type(:float) }
    it { is_expected.to have_db_column(:lot_type).of_type(:string) }
    it { is_expected.to have_db_column(:area_unit).of_type(:string) }
    it { is_expected.to have_db_column(:floor).of_type(:integer) }
    it { is_expected.to have_db_column(:floors_total).of_type(:integer) }
    it { is_expected.to have_db_column(:title_uk).of_type(:string) }
    it { is_expected.to have_db_column(:title_ru).of_type(:string) }
    it { is_expected.to have_db_column(:title_en).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:description_uk).of_type(:text) }
    it { is_expected.to have_db_column(:description_ru).of_type(:text) }
    it { is_expected.to have_db_column(:description_en).of_type(:text) }
    it { is_expected.to have_db_column(:renovation).of_type(:string) }
    it { is_expected.to have_db_column(:quality).of_type(:string) }
    it { is_expected.to have_db_column(:open_plan).of_type(:boolean) }
    it { is_expected.to have_db_column(:rooms_type).of_type(:string) }
    it { is_expected.to have_db_column(:phone).of_type(:boolean) }
    it { is_expected.to have_db_column(:internet).of_type(:boolean) }
    it { is_expected.to have_db_column(:room_furniture).of_type(:boolean) }
    it { is_expected.to have_db_column(:kitchen_furniture).of_type(:boolean) }
    it { is_expected.to have_db_column(:television).of_type(:boolean) }
    it { is_expected.to have_db_column(:washing_machine).of_type(:boolean) }
    it { is_expected.to have_db_column(:refrigerator).of_type(:boolean) }
    it { is_expected.to have_db_column(:balcony).of_type(:string) }
    it { is_expected.to have_db_column(:bathroom_unit).of_type(:string) }
    it { is_expected.to have_db_column(:floor_covering).of_type(:string) }
    it { is_expected.to have_db_column(:window_view).of_type(:string) }
    it { is_expected.to have_db_column(:building_name).of_type(:string) }
    it { is_expected.to have_db_column(:building_type).of_type(:string) }
    it { is_expected.to have_db_column(:building_series).of_type(:string) }
    it { is_expected.to have_db_column(:building_phase).of_type(:string) }
    it { is_expected.to have_db_column(:building_section).of_type(:string) }
    it { is_expected.to have_db_column(:building_state).of_type(:string) }
    it { is_expected.to have_db_column(:built_year).of_type(:integer) }
    it { is_expected.to have_db_column(:ready_quarter).of_type(:integer) }
    it { is_expected.to have_db_column(:lift).of_type(:boolean) }
    it { is_expected.to have_db_column(:rubbish_chute).of_type(:boolean) }
    it { is_expected.to have_db_column(:is_elite).of_type(:boolean) }
    it { is_expected.to have_db_column(:parking).of_type(:boolean) }
    it { is_expected.to have_db_column(:alarm).of_type(:boolean) }
    it { is_expected.to have_db_column(:ceiling_height).of_type(:float) }
    it { is_expected.to have_db_column(:pmg).of_type(:boolean) }
    it { is_expected.to have_db_column(:toilet).of_type(:string) }
    it { is_expected.to have_db_column(:shower).of_type(:string) }
    it { is_expected.to have_db_column(:kitchen).of_type(:boolean) }
    it { is_expected.to have_db_column(:pool).of_type(:boolean) }
    it { is_expected.to have_db_column(:billiard).of_type(:boolean) }
    it { is_expected.to have_db_column(:sauna).of_type(:boolean) }
    it { is_expected.to have_db_column(:heating_supply).of_type(:boolean) }
    it { is_expected.to have_db_column(:water_supply).of_type(:boolean) }
    it { is_expected.to have_db_column(:sewerage_supply).of_type(:boolean) }
    it { is_expected.to have_db_column(:electricity_supply).of_type(:boolean) }
    it { is_expected.to have_db_column(:gas_supply).of_type(:boolean) }
    it { is_expected.to have_db_column(:price).of_type(:float).with_options(null: false) }
    it { is_expected.to have_db_column(:price_currency).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:price_unit).of_type(:string) }
    it { is_expected.to have_db_column(:price_period).of_type(:string) }
    it { is_expected.to have_db_column(:price_m2).of_type(:float) }
    it { is_expected.to have_db_column(:price_dollars).of_type(:float) }
    it { is_expected.to have_db_column(:price_m2_dollars).of_type(:float) }
    it { is_expected.to have_db_column(:not_for_agents).of_type(:boolean) }
    it { is_expected.to have_db_column(:haggle).of_type(:boolean) }
    it { is_expected.to have_db_column(:mortgage).of_type(:boolean) }
    it { is_expected.to have_db_column(:prepayment).of_type(:float) }
    it { is_expected.to have_db_column(:rent_pledge).of_type(:boolean) }
    it { is_expected.to have_db_column(:from_owner).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:agent_fee).of_type(:float) }
    it { is_expected.to have_db_column(:no_agent_fee).of_type(:boolean) }
    it { is_expected.to have_db_column(:deal_status).of_type(:string) }
    it { is_expected.to have_db_column(:with_pets).of_type(:boolean) }
    it { is_expected.to have_db_column(:with_children).of_type(:boolean) }
    it { is_expected.to have_db_column(:manually_added).of_type(:boolean).with_options(default: true, null: false) }
    it { is_expected.to have_db_column(:expires_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:urgent).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:phone_first).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:phone_second).of_type(:string) }
    it { is_expected.to have_db_column(:phone_third).of_type(:string) }
    it { is_expected.to have_db_column(:phone_fourth).of_type(:string) }
    it { is_expected.to have_db_column(:user_name).of_type(:string) }
    it { is_expected.to have_db_column(:user_email).of_type(:string) }
    it { is_expected.to have_db_column(:active).of_type(:boolean).with_options(default: true, null: false) }
    it { is_expected.to have_db_column(:imported).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

    it { is_expected.to have_db_index :offer_type }
    it { is_expected.to have_db_index :category }
    it { is_expected.to have_db_index :region_id }
    it { is_expected.to have_db_index :district_id }
    it { is_expected.to have_db_index :locality_id }
    it { is_expected.to have_db_index :rooms }
    it { is_expected.to have_db_index :price }
    it { is_expected.to have_db_index :updated_at }
    it { is_expected.to have_db_index :user_id }
    it { is_expected.to have_db_index([:user_id, :code]).unique(true) }
  end

   context 'Associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :region }
    it { is_expected.to belong_to :district }
    it { is_expected.to belong_to :locality }
  end

  context 'Validations' do
    it { is_expected.to validate_inclusion_of(:offer_type).in_array(Offer::TYPES) }
    it { is_expected.to validate_inclusion_of(:category).in_array(Offer::CATEGORIES) }
    it { is_expected.to validate_presence_of(:region_id) }
    it { is_expected.to validate_presence_of(:district_id) }
    it { is_expected.to validate_presence_of(:locality_id) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_inclusion_of(:price_currency).in_array(Offer::CURRENCIES) }
    it { is_expected.to validate_presence_of(:phone_first) }
    it { is_expected.to validate_inclusion_of(:building_type).in_array(Offer::BUILDING_TYPES).allow_blank(true) }
    it { is_expected.to validate_inclusion_of(:bathroom_unit).in_array(Offer::BATHROOM_UNITS).allow_blank(true) }

    it { is_expected.to validate_inclusion_of(:area_unit).in_array(Offer::AREA_UNITS).allow_blank(true) }
    it { is_expected.to validate_inclusion_of(:price_unit).in_array(Offer::PRICE_UNITS).allow_blank(true) }

    context 'offer_type equals rent' do
      subject { build(:offer, offer_type: 'rent') }

      it { is_expected.to validate_inclusion_of(:price_period).in_array(Offer::PRICE_PERIODS) }
    end

    context 'offer_type equals sale' do
      subject { build(:offer, offer_type: 'sale') }

      it { is_expected.to validate_absence_of(:price_period) }
    end
  end

  describe '#inhabited_locality and #sub_locality' do
    let(:offer) { build(:offer, locality: locality) }

    context 'locality is sity district' do
      let(:locality) { create(:locality, category: 'district') }

      it '#inhabited_locality equals Offer#district' do
        expect(offer.inhabited_locality).to eq(offer.district)
      end

      it '#sub_locality equals Offer#locality' do
        expect(offer.sub_locality).to eq(offer.locality)
      end
    end

    context 'locality is not sity district' do
      let(:locality) { create(:locality, category: 'city') }

      it '#inhabited_locality equals Offer#locality' do
        expect(offer.inhabited_locality).to eq(offer.locality)
      end

      it '#sub_locality equals nil' do
        expect(offer.sub_locality).to be_nil
      end
    end
  end

  describe '#rent?' do
    it "is true if offer_type equals 'rent'" do
      expect(build(:offer, offer_type: 'rent')).to be_rent
    end

    it "is false if offer_type equals 'sale'" do
      expect(build(:offer, offer_type: 'sale')).not_to be_rent
    end
  end
end
