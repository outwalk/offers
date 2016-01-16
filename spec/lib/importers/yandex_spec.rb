require 'spec_helper'
require 'importers/yandex'

describe Importers::Yandex do
  include_context 'Initial Data'
  include_context 'Internet Source', 'atlaskvartir.ua'
  let(:agency) { create(:agency, slug: 'al-fa', name: 'Атлас Квартир',
    region: kyiv_oblast, district: kyiv, phone_first: '+380443843442',
    phone_second: '+380996397984', phone_third: '+380975448341', phone_fourth: '+380635315928',
    email: 'kontakt@atlaskvartir.ua', site: 'http://atlaskvartir.ua', import_enabled: true,
    import_type: 'Importers::Yandex', import_url: 'http://atlaskvartir.ua/export/yandex.xml') }
  subject { agency.importer }

  describe '.import_offers' do
    before { stub_const('Importers::Yandex::REGION_IDS', {}) }

    it 'parces agency XML feed and saves offers into the database' do
      subject.import_offers
      expect(Offer.where(imported: true).count).to eq 4
    end

    it 'updates already existing offers' do
      subject.import_offers
      subject.import_offers
      expect(Offer.where(imported: true).count).to eq 4
    end

    it 'imports offers by batches' do
      stub_const('Importers::Yandex::BATCH_SIZE', 2)
      subject.import_offers
      expect(Offer.where(imported: true).count).to eq 4
    end

    it 'parses offer lot_area and area_unit' do
      agency.update_column(:import_url, 'http://atlaskvartir.ua/export/yandex_lot.xml')
      subject.import_offers(debug: true)
      offer = Offer.where(imported: true).last
      expect(offer.lot_area).to eq 17
      expect(offer.area_unit).to eq 'a'
    end
  end
end
