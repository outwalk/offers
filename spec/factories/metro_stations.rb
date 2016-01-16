# encoding: utf-8
# == Schema Information
#
# Table name: metro_stations
#
#  id          :integer          not null, primary key
#  district_id :integer          not null
#  name_uk     :string(255)      not null
#  name_en     :string(255)      not null
#  name_ru     :string(255)      not null
#  color       :string(255)      not null
#  sequence    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


FactoryGirl.define do
  factory :metro_station do
    district
    name_uk "Палац спорту"
    name_en "Palats Sportu"
    name_ru "Дворец спорта"
    color "green"

    after(:build) do |metro_station, evaluator|
      metro_station.sequence = 315
    end
  end
end
