module DistrictsHelper
  def options_for_district_select(region_id, district_id = nil)
    if region_id.nil?
      "<option value=''>&nbsp;</option>"
    else
      districts = District.where(region_id: region_id).order(:"name_#{I18n.locale}")
      districts.each_with_object(["<option value=''>#{Offer.human_attribute_name('district_id')}</option>"]) do |d, options|
        options << "<option value=\"#{d.id}\" data-district-name=\"#{d.district_name}\"#{' selected="selected"' if d.id == district_id}>#{d.name}</option>"
      end.join('')
    end.html_safe
  end
end
