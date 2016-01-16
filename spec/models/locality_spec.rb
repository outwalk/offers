require 'spec_helper'
require 'shoulda-matchers'

describe Locality do
  subject { build(:locality) }
  it { is_expected.to be_valid }

  context 'Database' do
    it { is_expected.to have_db_column(:region_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:district_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:category).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name_uk).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name_ru).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name_en).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:phone_code).of_type(:string) }
    it { is_expected.to have_db_column(:non_admin).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:latitude).of_type(:decimal).with_options(precision: 12, scale: 8) }
    it { is_expected.to have_db_column(:longitude).of_type(:decimal).with_options(precision: 12, scale: 8) }
    it { is_expected.to have_db_column(:offers_count).of_type(:integer).with_options(default: 0, null: false) }
    it { is_expected.to have_db_column(:mk_settle_id).of_type(:integer) }

    it { is_expected.to have_db_index(:region_id) }
    it { is_expected.to have_db_index(:district_id) }
    it { is_expected.to have_db_index(:slug) }
    it { is_expected.to have_db_index(:name_uk) }
    it { is_expected.to have_db_index(:name_ru) }
    it { is_expected.to have_db_index(:name_en) }
    it { is_expected.to have_db_index(:mk_settle_id) }
  end

  context 'Associations' do
    it { is_expected.to belong_to :district }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :name_uk }
    it { is_expected.to validate_presence_of :name_ru }
    it { is_expected.to validate_uniqueness_of(:name_uk).scoped_to(:district_id).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:name_ru).scoped_to(:district_id).case_insensitive }
  end

  describe '#locality?' do
    it { is_expected.to be_locality }
  end

  describe '#sub_locality?' do
    it { is_expected.not_to be_sub_locality }
  end

  it_behaves_like 'translates attribute', :name
end
