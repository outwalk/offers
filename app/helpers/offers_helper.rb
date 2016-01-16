module OffersHelper
  def areas_list(offer)
    if offer.living_area || offer.kitchen_area
      "#{offer.area}/#{offer.living_area || '-'}/#{offer.kitchen_area || '-'}"
    else
      "#{offer.area} #{I18n.t('sq_m')}"
    end
  end

  def floors_list(offer)
    if offer.floor && offer.floors_count
      "#{offer.floor}/#{offer.floors_count}"
    elsif offer.floor
      "#{offer.floor} #{I18n.t('offer.floor')}"
    elsif offer.floors_count
      "#{I18n.t('offer.floors_total')}: #{offer.floors_count}"
    end
  end
end
