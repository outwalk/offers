# encoding: utf-8
require 'spec_helper'
require 'shoulda-matchers'

describe MetroStation, type: :model do
  subject { build(:metro_station, name_uk: 'Метробудівників') }
  it { is_expected.to be_valid }

  context 'Database' do
    it { is_expected.to have_db_column(:district_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:name_uk).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name_ru).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name_en).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:color).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:sequence).of_type(:integer).with_options(null: false) }

    it { is_expected.to have_db_index(:district_id) }
  end

  context 'Associations' do
    it { is_expected.to belong_to :district }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :district }
    it { is_expected.to validate_presence_of :name_uk }
    it { is_expected.to validate_presence_of :name_ru }
    it { is_expected.to validate_presence_of :color }
    it { is_expected.to validate_presence_of :sequence }
    it { is_expected.to validate_uniqueness_of(:name_uk).scoped_to(:district_id).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:name_ru).scoped_to(:district_id).case_insensitive }
  end

  context '.check_if_district_has_metro' do
    let(:district) { create(:district, has_metro: false) }
    let!(:metro_station) { create(:metro_station, district: district) }

    it "assigns District#hes_metro after_save" do
      expect(district.reload.has_metro).to be true
    end
  end
end
