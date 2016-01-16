module LocalitiesHelper
  def options_for_locality_select(district_id, locality_id = nil)
    if district_id.nil?
      "<option value=''>&nbsp;</option>"
    else
      prev_category = nil
      localities = Locality.where(district_id: district_id).order("category, name_#{I18n.locale}")
      localities.each_with_object(["<option value=''>#{Offer.human_attribute_name('locality_id')}</option>"]) do |l, options|
        if l.category && l.category != prev_category
          options << "<option disabled=\"disabled\">-- #{t("locality.categories." + l.category)} --</option>"
        end
        options << "<option value=\"#{l.id}\" data-category=\"#{l.category}\"#{' selected="selected"' if l.id == locality_id}>#{l.name}</option>"
        prev_category = l.category if l.category
      end.join('')
    end.html_safe
  end
end
