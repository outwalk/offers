require 'spec_helper'
require 'shoulda-matchers'

describe Region do
  specify { expect(build(:region)).to be_valid }

  context 'Database' do
    it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name_uk).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name_ru).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name_en).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:latitude).of_type(:decimal).with_options(precision: 12, scale: 8) }
    it { is_expected.to have_db_column(:longitude).of_type(:decimal).with_options(precision: 12, scale: 8) }
    it { is_expected.to have_db_column(:offers_count).of_type(:integer).with_options(default: 0) }
    it { is_expected.to have_db_column(:mk_region_id).of_type(:integer) }

    it { is_expected.to have_db_index(:slug) }
    it { is_expected.to have_db_index(:name_uk) }
    it { is_expected.to have_db_index(:name_ru) }
    it { is_expected.to have_db_index(:name_en) }
    it { is_expected.to have_db_index(:mk_region_id) }
  end

  context 'Associations' do
    it { is_expected.to have_many :districts }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_presence_of :name_uk }
    it { is_expected.to validate_presence_of :name_ru }
    it { is_expected.to validate_presence_of :name_en }

    it { is_expected.to allow_value('kyivska').for(:slug) }
    it { is_expected.not_to allow_value('Kyivska').for(:slug) }
    it { is_expected.not_to allow_value('kyivska oblast').for(:slug) }
    it { is_expected.not_to allow_value('kyivska_obl').for(:slug) }
  end

  it_behaves_like 'translates attribute', :name

  describe '.crimea' do
    let!(:krym) { create(:region, slug: 'krym') }

    it "returns region with slug 'krym'" do
      expect(described_class.crimea).to eq krym
    end
  end
end
