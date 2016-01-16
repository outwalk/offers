# encoding: utf-8
require 'spec_helper'
require 'shoulda-matchers'

describe Article do
  subject { build(:article) }
  it { is_expected.to be_valid }

  context 'Database' do
    it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:language).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:source).of_type(:string) }
    it { is_expected.to have_db_column(:source_url).of_type(:string) }
    it { is_expected.to have_db_column(:category).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:section).of_type(:string) }
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:description).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:images).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:intro).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:body).of_type(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:author).of_type(:string) }
    it { is_expected.to have_db_column(:written_on).of_type(:date) }
    it { is_expected.to have_db_column(:origin_id).of_type(:integer) }
    it { is_expected.to have_db_column(:uk_translation_id).of_type(:integer) }
    it { is_expected.to have_db_column(:ru_translation_id).of_type(:integer) }
    it { is_expected.to have_db_column(:en_translation_id).of_type(:integer) }

    it { is_expected.to have_db_index(:slug) }
    it { is_expected.to have_db_index(:language) }
    it { is_expected.to have_db_index(:source) }
    it { is_expected.to have_db_index(:category) }
    it { is_expected.to have_db_index(:section) }
    it { is_expected.to have_db_index(:body) } unless ENV['TRAVIS'] == 'true'
    it { is_expected.to have_db_index(:origin_id) }
    it { is_expected.to have_db_index(:uk_translation_id) }
    it { is_expected.to have_db_index(:ru_translation_id) }
    it { is_expected.to have_db_index(:en_translation_id) }
  end

  context 'Associations' do
    it { is_expected.to belong_to :origin }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :language }
    it { is_expected.to validate_presence_of :category }
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body }
  end

  describe '.category_exists?' do
    before { subject.save }

    it 'returns true if category exists' do
      expect(described_class).to be_category_exists 'Ціни на нафту'
    end

    it "returns false if category doesn't exist" do
      expect(described_class).not_to be_category_exists 'Енергія'
    end
  end

  describe '.section_exists?' do
    before do
      subject.save
      create(:article, section: nil)
      create(:article, section: '')
    end

    it 'returns true if sectiony exists in current locale' do
      expect(described_class).to be_section_exists 'Альтернативна енергетика'
    end

    it "returns false if section doesn't exist in current locale" do
      expect(described_class).not_to be_section_exists 'Природний газ'
    end

    it "returns false if section blank" do
      expect(described_class).not_to be_section_exists ''
    end

    it "returns false if section nil" do
      expect(described_class).not_to be_section_exists nil
    end
  end

  describe '.recent' do
    before { create_list(:article, 30, language: 'uk') }
    let!(:recent_10_articles) { create_list(:article, 10, language: 'uk') }

    it 'returns 10 recent articles in current locale sorted by id in desc order' do
      expect(described_class.recent.pluck(:id)).to eq recent_10_articles.map(&:id).reverse
    end
  end

  describe '.categories' do
    include_context 'Articles'

    context 'default locale' do
      it 'returns all categories in current locale' do
        expect(described_class.categories).to match_array ["Альтернативна енергетика",
          "Енергія", "Світова політика", "Ціни на нафту"]
      end
    end

    context 'ru locale' do
      it 'returns all categories in current locale' do
        I18n.with_locale(:ru) do
          expect(described_class.categories).to match_array ["Энергия"]
        end
      end
    end
  end

  describe '#intro' do
    subject { create(:article) }

    it 'is assigned to truncated HTML of body limited to 600 characters' do
      expect(subject.intro).to eq '<p>Google може мати погану репутацію на політику конфіденційності, ' \
        'але коли справа доходить до зеленого, інтернет-гігант чистий, гризучи більше $ 850 мільйонів інвестицій ' \
        'для розробки та розгортання екологічно чистої енергії і заробляти перше місце в списку Грінпіс ІТ гігантів, ' \
        'які використовуючи і пропаганда екологічно чистої енергії.</p> <p>У лютому, Грінпіс ранг компанії Google є ' \
        'кращим її &quot;Cool IT лідерів&quot;, хоча це тільки забив 53 з 100 пунктів на рейтинговій системі, ' \
        'як і раніше поставивши його попереду Cisco, з 49 пунктів. Але це було неохоче подарунок від Грінпіс, яка була цькування...</p>'
    end
  end

  describe '#slug' do
    context 'uk locale' do
      subject { create(:article, language: 'uk', title: 'Німеччина виділяє $ 130 млрд. з поновлюваних джерел енергії') }

      it 'is generated from title on save' do
        expect(subject.slug).to eq 'nimechchyna-vydiliaie-130-mlrd-z-ponovliuvanykh-dzherel-enerhii'
      end
    end

    context 'ru locale' do
      subject { create(:article, language: 'ru', title: 'Германия выделяет 130 млрд. долларов по возобновляемым источникам энергии') }

      it 'is generated from title on save' do
        expect(subject.slug).to eq 'germaniya-vydelyaet-130-mlrd-dollarov-po-vozobnovlyaemym-istochnikam-energii'
      end
    end

    context 'en locale' do
      subject { create(:article, language: 'en', title: 'Germany Sets Aside $130 Billion for Renewable Energy') }

      it 'is generated from title on save' do
        expect(subject.slug).to eq 'germany-sets-aside-130-billion-for-renewable-energy'
      end
    end
  end
end
