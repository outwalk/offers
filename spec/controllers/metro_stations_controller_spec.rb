# encoding: utf-8
require "spec_helper"

describe MetroStationsController, type: :controller do
  render_views
  login_user
  let!(:metro_station) { create(:metro_station, name_uk: 'Вокзальна') }
  let!(:metro_station_of_the_other_district) { create(:metro_station) }

  describe "GET #index" do
    it "returns list of metro_stations for selected district if locality_category is 'district'" do
      xhr :get, :index, district_id: metro_station.district_id, locality_category: 'district'
      expect(response).to have_http_status(:success)
      expect(response.body).to eq <<-JS.strip_heredoc
        $('#offer_metro_station_id').html('<option value=\\'\\'>Найближча станція метро<\\/option><option value=\\\"#{metro_station.id}\\\">Вокзальна<\\/option>').select2({theme: \"bootstrap\"});
      JS
    end
  end
end
