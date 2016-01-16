# encoding: utf-8
require 'spec_helper'

describe OffersHelper, type: :helper do
  describe 'areas_list' do
    it 'returns all areas divided with slash if all present' do
      offer = build(:offer, area: 35.4, living_area: 17.2, kitchen_area: 11.8)
      expect(helper.areas_list(offer)).to eq('35.4/17.2/11.8')
    end

    it 'returns all areas divided with slash if living_area is blank and kitchen_area is present' do
      offer = build(:offer, area: 35.4, living_area: nil, kitchen_area: 11.8)
      expect(helper.areas_list(offer)).to eq('35.4/-/11.8')
    end

    it 'returns all areas divided with slash if living_area is present and kitchen_area is blank' do
      offer = build(:offer, area: 35.4, living_area: 17.2, kitchen_area: nil)
      expect(helper.areas_list(offer)).to eq('35.4/17.2/-')
    end

    it 'returns only total area if living_area is blank and kitchen_area is blank' do
      offer = build(:offer, area: 35.4, living_area: nil, kitchen_area: nil)
      expect(helper.areas_list(offer)).to eq('35.4 кв. м')
    end
  end

  describe 'floors_list' do
    it 'returns floor and floors count divided with slash if both present' do
      offer = build(:offer, floor: 17, floors_count: 20)
      expect(helper.floors_list(offer)).to eq('17/20')
    end

    it 'returns floor suffixed with human_attribute_name if only floor present' do
      offer = build(:offer, floor: 17, floors_count: nil)
      expect(helper.floors_list(offer)).to eq('17 поверх')
    end

    it 'returns floors_count prefixed with human_attribute_name if only floors_count present' do
      offer = build(:offer, floor: nil, floors_count: 20)
      expect(helper.floors_list(offer)).to eq('поверховість: 20')
    end
  end
end
