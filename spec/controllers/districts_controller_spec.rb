# encoding: utf-8
require "spec_helper"

describe DistrictsController, type: :controller do
  render_views
  login_user
  let!(:district) { create(:district, name_uk: 'Дніпропетровськ', district_name_uk: 'Дніпропетровський район') }
  let!(:district_of_the_other_region) { create(:district) }

  describe "GET #index" do
    it "returns list of districts for selected region" do
      xhr :get, :index, region_id: district.region_id
      expect(response).to have_http_status(:success)
      expect(response.body).to eq <<-JS.strip_heredoc
        $('#offer_district_id').html('<option value=\\'\\'>Район області / місто<\\/option><option value=\\\"#{district.id}\\\" data-district-name=\\\"Дніпропетровський район\\\">Дніпропетровськ<\\/option>').data(\"placeholder\", \"Район області / місто\").select2({theme: \"bootstrap\"});
      JS
    end
  end
end
