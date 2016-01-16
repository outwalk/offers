# encoding: utf-8
require 'spec_helper'
require 'shoulda-matchers'

describe District do
  subject { build(:district, district_name_uk: 'Сумський район', name_uk: 'Суми') }
  it { is_expected.to be_valid }

  context 'Database' do
    it { is_expected.to have_db_column(:region_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:district_name_uk).of_type(:string) }
    it { is_expected.to have_db_column(:name_uk).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:district_name_ru).of_type(:string) }
    it { is_expected.to have_db_column(:name_ru).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:district_name_en).of_type(:string) }
    it { is_expected.to have_db_column(:name_en).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:phone_code).of_type(:string) }
    it { is_expected.to have_db_column(:region_status).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:latitude).of_type(:decimal).with_options(precision: 12, scale: 8) }
    it { is_expected.to have_db_column(:longitude).of_type(:decimal).with_options(precision: 12, scale: 8) }
    it { is_expected.to have_db_column(:offers_count).of_type(:integer).with_options(default: 0) }
    it { is_expected.to have_db_column(:mk_district_id).of_type(:integer) }

    it { is_expected.to have_db_index(:region_id) }
    it { is_expected.to have_db_index(:slug) }
    it { is_expected.to have_db_index(:district_name_uk) }
    it { is_expected.to have_db_index(:name_uk) }
    it { is_expected.to have_db_index(:district_name_ru) }
    it { is_expected.to have_db_index(:name_ru) }
    it { is_expected.to have_db_index(:district_name_en) }
    it { is_expected.to have_db_index(:name_en) }
    it { is_expected.to have_db_index(:mk_district_id) }
  end

  context 'Associations' do
    it { is_expected.to belong_to :region }
    it { is_expected.to have_many :localities }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :name_uk }
    it { is_expected.to validate_presence_of :name_ru }
    it { is_expected.to validate_uniqueness_of(:name_uk).scoped_to(:region_id).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:name_ru).scoped_to(:region_id).case_insensitive }
  end

  it_behaves_like 'translates attribute', :name
  it_behaves_like 'translates attribute', :district_name

  describe '#full_name' do
    it 'is equal to joined district_name_uk and name_uk if both present' do
      expect(subject.full_name).to eq "#{subject.district_name_uk} / #{subject.name_uk}"
    end

    it 'is equal to name_uk if district_name_uk blank' do
      subject.district_name_uk = nil
      expect(subject.full_name).to eq subject.name_uk
    end

    it 'is equal to name_uk if district_name_uk is equal to name_uk' do
      district = build(:district, district_name_uk: 'Київ', name_uk: 'Київ')
      expect(district.full_name).to eq district.name_uk
    end
  end
end
