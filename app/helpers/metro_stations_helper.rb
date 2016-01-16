module MetroStationsHelper
  def options_for_metro_station_select(district_id, locality_category, metro_station_id = nil)
    if district_id.to_i.in?(MetroStation.district_ids) && locality_category == 'district'
      MetroStation.where(district_id: district_id).order(:sequence).each_with_object(["<option value=''>#{Offer.human_attribute_name('metro_station_id')}</option>"]) do |ms, options|
        options << "<option value=\"#{ms.id}\"#{' selected="selected"' if ms.id == metro_station_id}>#{ms.name}</option>"
      end.join('')
    else
      ''
    end.html_safe
  end
end
