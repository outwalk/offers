require 'spec_helper'
require 'shoulda-matchers'

describe Agency do
  subject { build(:agency, phone_first: '(096)187-89-37', slug: 'al-fa') }
  it { is_expected.to be_valid }

  context 'Database' do
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:full_name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:summary).of_type(:text) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:logo).of_type(:string) }
    it { is_expected.to have_db_column(:region_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:district_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:phone_first).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:phone_second).of_type(:string) }
    it { is_expected.to have_db_column(:phone_third).of_type(:string) }
    it { is_expected.to have_db_column(:phone_fourth).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:site).of_type(:string) }
    it { is_expected.to have_db_column(:latitude).of_type(:decimal).with_options(precision: 12, scale: 8) }
    it { is_expected.to have_db_column(:longitude).of_type(:decimal).with_options(precision: 12, scale: 8) }
    it { is_expected.to have_db_column(:visible).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:rank).of_type(:integer).with_options(default: 0, null: false) }
    it { is_expected.to have_db_column(:import_enabled).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:import_type).of_type(:string) }
    it { is_expected.to have_db_column(:import_url).of_type(:string) }
    it { is_expected.to have_db_column(:offers_count).of_type(:integer).with_options(default: 0, null: false) }
    it { is_expected.to have_db_column(:twitter_enabled).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:twitter_email).of_type(:string) }
    it { is_expected.to have_db_column(:twitter_password).of_type(:string) }
    it { is_expected.to have_db_column(:twitter_username).of_type(:string) }
    it { is_expected.to have_db_column(:twitter_consumer_key).of_type(:string) }
    it { is_expected.to have_db_column(:twitter_consumer_secret).of_type(:string) }
    it { is_expected.to have_db_column(:twitter_oauth_token).of_type(:string) }
    it { is_expected.to have_db_column(:twitter_oauth_token_secret).of_type(:string) }

    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:slug) }
    it { is_expected.to have_db_index(:name) }
    it { is_expected.to have_db_index(:phone_first).unique(true) }
  end

  context 'Associations' do
    it { is_expected.to belong_to :region }
    it { is_expected.to belong_to :district }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :full_name }
    it { is_expected.to validate_presence_of :region }
    it { is_expected.to validate_presence_of :district }
    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_presence_of :phone_first }

    context 'Uniqueness' do
      before { create(:agency, phone_first: '(044)987-65-43', slug: 'al-fa') }

      it { is_expected.to validate_uniqueness_of(:slug).case_insensitive }
      it { is_expected.to validate_uniqueness_of(:phone_first).case_insensitive }
    end

    context 'Import enabled' do
      it { is_expected.to validate_presence_of :import_type }
      it { is_expected.to validate_presence_of :xml_url }
    end

    context 'Import disabled' do
      subject { build(:agency, import_enabled: false) }

      it { is_expected.not_to validate_presence_of :import_type }
      it { is_expected.not_to validate_presence_of :xml_url }
    end
  end

  describe '#twitter_client' do
    it 'is nil if twitter_enabled equals false' do
      expect(subject.twitter_client).to be_nil
    end

    it 'is present if twitter_enabled equals true' do
      subject.twitter_enabled = true
      twitter_client = double('Twitter Client')
      require 'twitter'
      allow(Twitter::Client).to receive(:new).with(
        consumer_key: subject.twitter_consumer_key,
        consumer_secret: subject.twitter_consumer_secret,
        oauth_token: subject.twitter_oauth_token,
        oauth_token_secret: subject.twitter_oauth_token_secret
      ).and_return(twitter_client)

      expect(subject.twitter_client).to eq twitter_client
    end
  end
end
