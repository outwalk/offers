require "spec_helper"

describe DistrictsHelper, type: :helper do
  describe "options_for_district_select" do
    let!(:district) { create(:district, name_uk: 'Дніпропетровськ', district_name_uk: 'Дніпропетровський район') }
    let!(:district_of_the_other_region) { create(:district) }

    it "returns HTML options for select district_id" do
      expect(helper.options_for_district_select(district.region_id)).to eq("<option value=''>Район області / місто</option>" \
        "<option value=\"#{district.id}\" data-district-name=\"Дніпропетровський район\">Дніпропетровськ</option>")
    end

    it 'returns one empty option if region_id is nil' do
      expect(helper.options_for_district_select(nil)).to eq("<option value=''>&nbsp;</option>")
    end
  end
end
