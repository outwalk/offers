# encoding: utf-8
require 'spec_helper'
require 'shoulda-matchers'

describe User do
  specify { expect(build(:user)).to be_valid }

  context 'Database' do
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:sign_in_count).of_type(:integer).with_options(default: 0, null: false) }
    it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:current_sign_in_ip).of_type(:string) }
    it { is_expected.to have_db_column(:last_sign_in_ip).of_type(:string) }
    it { is_expected.to have_db_column(:confirmation_token).of_type(:string) }
    it { is_expected.to have_db_column(:confirmed_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:confirmation_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:unconfirmed_email).of_type(:string) }
    it { is_expected.to have_db_column(:failed_attempts).of_type(:integer).with_options(default: 0, null: false) }
    it { is_expected.to have_db_column(:unlock_token).of_type(:string) }
    it { is_expected.to have_db_column(:locked_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:authentication_token).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:phone_first).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:phone_second).of_type(:string) }
    it { is_expected.to have_db_column(:phone_third).of_type(:string) }
    it { is_expected.to have_db_column(:phone_fourth).of_type(:string) }
    it { is_expected.to have_db_column(:slogan).of_type(:string) }
    it { is_expected.to have_db_column(:agency_id).of_type(:integer) }
    it { is_expected.to have_db_column(:region_id).of_type(:integer) }
    it { is_expected.to have_db_column(:district_id).of_type(:integer) }
    it { is_expected.to have_db_column(:locality_id).of_type(:integer) }
    it { is_expected.to have_db_column(:terms_of_service).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:subscribed).of_type(:boolean).with_options(default: false, null: false) }
    it { is_expected.to have_db_column(:language).of_type(:string) }
    it { is_expected.to have_db_column(:offers_count).of_type(:integer).with_options(default: 0, null: false) }
    it { is_expected.to have_db_column(:admin).of_type(:boolean).with_options(default: false, null: false) }

    it { is_expected.to have_db_index(:email).unique(true) }
    it { is_expected.to have_db_index(:reset_password_token).unique(true) }
    it { is_expected.to have_db_index(:confirmation_token).unique(true) }
    it { is_expected.to have_db_index(:unlock_token).unique(true) }
    it { is_expected.to have_db_index(:authentication_token).unique(true) }

    it { is_expected.to have_db_index(:phone_first).unique(true) }
    it { is_expected.to have_db_index(:phone_second) }
    it { is_expected.to have_db_index(:phone_third) }
    it { is_expected.to have_db_index(:phone_fourth) }
    it { is_expected.to have_db_index(:agency_id) }
    it { is_expected.to have_db_index(:admin) }
  end

  context 'Associations' do
    it { is_expected.to belong_to :region }
    it { is_expected.to belong_to :district }
    it { is_expected.to belong_to :locality }
    it { is_expected.to belong_to :agency }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :phone_first }
    it { is_expected.to validate_presence_of :name }

    context 'uniqueness of :phone_first' do
      before { create(:user, phone_first: '(044)987-65-43') }
      subject { build(:user, phone_first: '(044)987-65-43') }

      it 'validates uniqueness of :phone_first' do
        is_expected.to be_invalid
        expect(subject.errors[:phone_first]).to include 'вже зайнятий'
      end
    end
  end
end
