require 'spec_helper'
require 'shoulda-matchers'

describe Support, type: :model do
  subject { build(:support) }
  specify { is_expected.to be_valid }

  context 'Database' do
    it { is_expected.to have_db_column(:language).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:body).of_type(:text).with_options(null: false) }

    it { is_expected.to have_db_index(:language) }
    it { is_expected.to have_db_index(:slug) }
    it { is_expected.to have_db_index([:language, :slug]).unique(true) }
    it { is_expected.to have_db_index(:body) } unless ENV['TRAVIS'] == 'true'
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :language }
    it { is_expected.to validate_presence_of :slug }
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body }

    it { is_expected.to validate_uniqueness_of(:slug).scoped_to(:language) }
  end
end
