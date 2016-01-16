# encoding: utf-8
require "spec_helper"

describe LocalitiesController, type: :controller do
  render_views
  login_user
  let!(:locality) { create(:locality, name_uk: 'Жовтневий', category: 'district') }
  let!(:locality_of_the_other_district) { create(:locality) }

  describe "GET #index" do
    it "returns list of localities for selected district" do
      xhr :get, :index, district_id: locality.district_id
      expect(response).to have_http_status(:success)
      expect(response.body).to eq <<-JS.strip_heredoc
        $('#offer_locality_id').html('<option value=\\'\\'>Район міста / населений пункт<\\/option><option disabled=\\\"disabled\\\">-- район --<\\/option><option value=\\\"#{locality.id}\\\" data-category=\\\"district\\\">Жовтневий<\\/option>').data(\"placeholder\", \"Район міста / населений пункт\").select2({theme: \"bootstrap\"});
      JS
    end
  end
end
