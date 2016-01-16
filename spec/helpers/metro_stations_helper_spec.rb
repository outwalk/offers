require "spec_helper"

describe MetroStationsHelper, type: :helper do
  describe "options_for_metro_station_select" do
    let!(:metro_station) { create(:metro_station, name_uk: 'Вокзальна') }
    let!(:metro_station_of_the_other_district) { create(:metro_station) }

    it "returns HTML options for select metro_station_id" do
      expect(helper.options_for_metro_station_select(metro_station.district_id, 'district')).to eq("<option value=''>Найближча станція метро</option>" \
        "<option value=\"#{metro_station.id}\">Вокзальна</option>")
    end

    it 'returns blank string if district has no metro stations' do
      expect(helper.options_for_metro_station_select(create(:district).id, 'district')).to eq('')
    end

    it "returns blank string if district has metro stations but locality_category is not 'district'" do
      expect(helper.options_for_metro_station_select(metro_station.district_id, 'city')).to eq('')
    end
  end
end
