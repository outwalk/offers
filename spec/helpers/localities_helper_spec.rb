require "spec_helper"

describe LocalitiesHelper, type: :helper do
  describe "options_for_locality_select" do
    let!(:locality) { create(:locality, name_uk: 'Жовтневий', category: 'district') }
    let!(:locality_of_the_other_district) { create(:locality) }

    it "returns HTML options for select locality_id" do
      expect(helper.options_for_locality_select(locality.district_id)).to eq("<option value=''>Район міста / населений пункт</option>" \
        "<option disabled=\"disabled\">-- район --</option><option value=\"#{locality.id}\" data-category=\"district\">Жовтневий</option>")
    end

    it 'returns one empty option if district_id is nil' do
      expect(helper.options_for_locality_select(nil)).to eq("<option value=''>&nbsp;</option>")
    end
  end
end
